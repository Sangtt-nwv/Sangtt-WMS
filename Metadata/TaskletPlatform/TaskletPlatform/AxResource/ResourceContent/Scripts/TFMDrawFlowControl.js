const DrawFlowModule = (function () {
    const objectStore = {};

    return {
        addObject: function (key, obj) {
            objectStore[key] = obj;
        },
        getObject: function (key) {
            return objectStore[key];
        },
        getAllObjects: function () {
            return objectStore;
        },
        removeObject: function (key) {
            delete objectStore[key];
        }
    };
})();

function redrawConnections() {
    Object.keys(this.drawflow.drawflow[this.module].data).forEach(nodeId => {
        this.updateConnectionNodes(`node-${nodeId}`);
    });
    for (var e in this.drawflow.drawflow[this.module].data)
        this.updateConnectionNodes("node-" + e);
}

function moveAllNodes(dx, dy) {
    Object.keys(this.drawflow.drawflow[this.module].data).forEach(nodeId => {
        const node = this.drawflow.drawflow[this.module].data[nodeId];

        // Get the current position of the node
        const startX = node.pos_x;
        const startY = node.pos_y;

        // Calculate the new position
        const endX = startX + dx;
        const endY = startY + dy;

        // Get the DOM element for the node
        const domNode = this.container.querySelector(`#node-${nodeId} .drawflow_content_node`);
        if (domNode) {
            // Emulate mouse down at the start position
            this.triggerMouseEvent(domNode, 'mousedown', startX, startY);

            // Emulate mouse move to the end position
            this.triggerMouseEvent(document, 'mousemove', endX, endY);

            // Emulate mouse up at the end position
            this.triggerMouseEvent(document, 'mouseup', endX, endY);
        }

        // Update the node's position
        node.pos_x = endX;
        node.pos_y = endY;

        // Update the node's style to reflect the new position
        const parentNode = this.container.querySelector(`#node-${nodeId}`);
        if (parentNode) {
            parentNode.style.left = `${endX}px`;
            parentNode.style.top = `${endY}px`;
        }

        // Update connections for the moved node
        this.updateConnectionNodes(`node-${nodeId}`);
    });

    // Dispatch a custom event for each node moved
    Object.keys(this.drawflow.drawflow[this.module].data).forEach(nodeId => {
        this.dispatch("nodeMoved", nodeId);
    });
}

function triggerMouseEvent(node, eventType, clientX, clientY) {
    const event = new MouseEvent(eventType, {
        bubbles: true,
        cancelable: true,
        view: window,
        clientX: clientX,
        clientY: clientY,
    });
    node.dispatchEvent(event);
}


// click wrapper to make sure that when in fixed mode then node select will still work.
function clickwrapper(e) {
   if (this.editor_mode != 'edit') {
        //this.dispatch('click', e);
        if (e.target.closest(".drawflow_content_node") != null) {
            this.ele_selected = e.target.closest(".drawflow_content_node").parentElement;
            // Handle select only
            switch (this.ele_selected.classList[0]) {
                case 'drawflow-node':
                    if (this.node_selected != null) {
                        this.node_selected.classList.remove("selected");
                        if (this.node_selected != this.ele_selected) {
                            this.dispatch('nodeUnselected', true);
                        }
                    }
                    if (this.node_selected != this.ele_selected) {
                        this.dispatch('nodeSelected', this.ele_selected.id.slice(5));
                    }
                    this.node_selected = this.ele_selected;
                    this.node_selected.classList.add("selected");
                    return true;
                default: return false;
            }
        }
    }
    else {
        // if there is a connection on the output node already then ignore the click.
        this.ele_selected = e.target;
        switch (this.ele_selected.classList[0]) {
            case 'output':
                var id_output = e.target.parentElement.parentElement.id.slice(5);
                var output_class = e.target.classList[1];
                var dataNode = this.getNodeFromId(id_output);
                if (dataNode.outputs[output_class].connections.length > 0) {
                    return;
                }
       }
    }

    return this.orgclick(e);
}

function disallowDelete(rightClickedObj) {

    if (rightClickedObj != undefined && (rightClickedObj.classList.contains('Undeletable') || rightClickedObj.parentElement.classList.contains('Undeletable'))) {
        return true;
    }
    return false;
}

// Wraps the context menu so the menu is not displayed if the undeleteable is added.

(function () {
    'use strict';
    $dyn.ui.defaults.TFMDrawFlowControl = {};
    $dyn.controls.TFMDrawFlowControl = function (data, element) {
        var self = this;
        $dyn.ui.Control.apply(self, arguments);
        $dyn.ui.applyDefaults(self, data, $dyn.ui.defaults.TFMDrawFlowControl);

        var editorName = 'dfeditor_' + self._serverId;

        var drawflowElement = $('div[data-dyn-serverid="' + self._serverId + '"] #drawflow')[0];
        
        var editor = DrawFlowModule.getObject(editorName);
        if (editor == undefined) {

            // add methods to the drawflow library
            Drawflow.prototype.redrawConnections = redrawConnections;
            Drawflow.prototype.moveAllNodes      = moveAllNodes;
            Drawflow.prototype.triggerMouseEvent = triggerMouseEvent;
            Drawflow.prototype.orgclick = Drawflow.prototype.click; //saving the click function for later use.
            Drawflow.prototype.orgContextMenu = Drawflow.prototype.contextmenu;
            Drawflow.prototype.orgKey = Drawflow.prototype.key;

            editor = new Drawflow(drawflowElement); // the drawflow library is described here: https://github.com/jerosoler/Drawflow/blob/master/README.md#events
            editor.click = clickwrapper; // calling the wrapper instead of the click.

            DrawFlowModule.addObject(editorName, editor);
        }
        

        editor.on('nodeCreated', function (id) {
            console.log("Node created " + id);
            self.sendNewNodetoD365(id);
        })

        editor.on('nodeRemoved', function (id) {
            console.log("Node removed " + id);
            self.sendDeleteNodeToD365(id);
        })

        editor.on('click', function (event) {
            console.log("Node click " + event);
        })

        editor.on('clickEnd', function (event) {
            console.log("Node clicked " + event);
        })

        editor.on('nodeSelected', function (name) {
            console.log("Node selected " + name);
            self.notifyD365(name);
            simulateF2KeyPress();
        })

        editor.on('connectionCreated', function (connection) {
            console.log('Connection created');
            console.log(connection);
            setTimeout(() => { self.sendConnectionToD365(connection); }, 100);
        })

        editor.on('connectionRemoved', function (connection) {
            console.log('Connection removed');
            console.log(connection);
            setTimeout(() => { self.sendDeletedConnection(connection); }, 50);
        })

        self.toggleLoaderVisibility = function (_visible) {
            var loader = document.getElementById('drawflowloader');
            loader.style.display = _visible ? 'block' : 'None';
        }

        self.redraw = function (event) {
            editor.redrawConnections();
        }

        self.sendJSONtoD365 = function (event) {
            var jsonStr = JSON.stringify(editor.export(), null, 4);
            var params = { _json: jsonStr };
            $dyn.callFunction(self.saveBlocks, self, params);
        }

        self.notifyD365 = function (_data) {
            $dyn.callFunction(self.nodeSelected, self, { _id: _data });
        }

        self.deleteConnectionBetweenNodesCallback = function (_data) {

            if (_data == undefined) {
                return;
            }
            console.log("delete Connection, really!!");
            var connectData = JSON.parse(_data);
            editor.removeSingleConnection(connectData.output_id, connectData.input_id, connectData.output_class, connectData.input_class);
        }

        self.sendNewNodetoD365 = function (_data) {
            var jsonStr = JSON.stringify(editor.export(), null, 4);
            var params = { _id: _data, _json: jsonStr };
            $dyn.callFunction(self.nodeCreated, self, params);
        }

        self.sendConnectionToD365 = function (_connection) {
            var jsonStr = JSON.stringify(_connection, null, 4);
            var params = { _json: jsonStr };
            $dyn.callFunction(self.nodesConnected, self, params, self.deleteConnectionBetweenNodesCallback);
        }

        self.sendDeletedConnection = function (_connection) {
            var jsonStr = JSON.stringify(_connection, null, 4);
            var params = { _json: jsonStr };
            $dyn.callFunction(self.connectionDeleted, self, params);

        }

        self.sendDeleteNodeToD365 = function (_id) {
            var params = { _id: _id };
            $dyn.callFunction(self.nodeDeleted, self, params);
        }

        self.blockListCallBack = function (_sJSON) {

            var categorySet = new Set();
            var blockList = $.parseJSON(_sJSON, true);
            var i = 0;
            var table = $('div[data-dyn-serverid="' + self._serverId + '"] #blockColumn');
            for (i = 0; i <= blockList.length - 1; i++) {

                var blockListItem = blockList[i];
                var id = blockListItem.parmBlockName;
                var name = blockListItem.parmClassName;
                var resourcePath = blockListItem.parmResourcePath;
                var classType = blockListItem.ClassType;
                var boxText = blockListItem.BoxText;
                var numberOfInputs = blockListItem.NumberOfInputs;
                var numberOfOutputs = blockListItem.NumberOfOutputs;
                var editorId = blockListItem.editorName;
                var categories = blockListItem.categories;

                categories.forEach(value => {
                    categorySet.add(value);
                });

                var childNode = '<div class="drag-drawflow dragyellow" draggable="true" ondragstart="drag(event)" data-categories="' + categories + '" data-node="' + classType + '|' + id + '|' + name + '|' + resourcePath + '|' + boxText + '|' + numberOfInputs + '|' + numberOfOutputs + '|' + editorId + '">'
                    + '<i class="fab fa-logicblock"></i><img src="' + resourcePath + '" ><span><b>' + id + '</b></span>'
                    + '</div > ';

                table[0].innerHTML += childNode
            }
            if (i == 0) {
                //Delete block column, as it has no content
                table.remove();
            }

            var filterButtonsStr = '<div class="filter-buttons" >';
            categorySet.forEach(value => {
                filterButtonsStr += '<button class="filter-btn" onclick="filterDrawflowBlocks(this)" id="' + value+'" >' + value + '</button>';
            });
            filterButtonsStr += '</div>';
            table[0].innerHTML = filterButtonsStr + table[0].innerHTML;
        }

        self.updateSingleNodeHtmlCallBack = function (_sJSON) {

            if (_sJSON == undefined) {
                return;
            }
            var stepInfo = $.parseJSON(_sJSON, true);


            var stepId = `node-${stepInfo.id}`;
            var stepHtml = stepInfo.html;

            var stepNode = document.querySelector(`#node-${stepInfo.id} .drawflow_content_node`);
            if (stepNode != undefined) {
                stepNode.innerHTML = stepHtml;
            }
        }   

        self.zoom_in = function () {
            editor.zoom_in();
        }

        self.zoom_out = function () {
            editor.zoom_out();
        }

        self.zoom_reset = function () 
        {
            editor.zoom_reset();
        }

        self.updateLabelForInputOutput = function(redraw)
        {
            setTimeout(() => {

                // add the connections names

                var outputCounter = 0;
                var currentParentId = -1
                $('div.logicblockoutput').each(function () {

                    var outputLabel = this;
                    if (outputLabel.parentNode != undefined) {

                        var outputLabelParentId = outputLabel.parentNode.parentNode.id;

                        if (currentParentId != outputLabelParentId) {
                            outputCounter = 0;
                        }
                        currentParentId = outputLabelParentId;

                        outputCounter++;
                        self.doUpdateLabelForInputOutput(this, 'output', outputCounter);
                    } else {
                        outputCounter++;
                    }
                    
                });

                outputCounter = 0;
                currentParentId = -1
                $('div.logicblockinput').each(function () {

                    var outputLabel = this;

                    if (outputLabel.parentNode != undefined) {
                        var outputLabelParentId = outputLabel.parentNode.parentNode.id;

                        if (currentParentId != outputLabelParentId) {
                            outputCounter = 0;
                        }
                        currentParentId = outputLabelParentId;

                        outputCounter++;

                        self.doUpdateLabelForInputOutput(this, 'input', outputCounter);    
                    }
                    else {
                        outputCounter++;
                    }
                });

                if (redraw) {
                    editor.redrawConnections();
                }
                self.toggleLoaderVisibility(false);

            }, 200);
        }

        self.doUpdateLabelForInputOutput = function (_logicBlockInputOutputDiv, divClassName, outputCounter)
        {
            var outputLabel = _logicBlockInputOutputDiv;
            var divClass = divClassName + '_' + outputCounter;
            
            $('#' + outputLabel.parentNode.parentNode.id + ' div.' + divClassName + '_' + outputCounter).each(function () {
                {
                    //remove if already there
                    var existingNode = this.parentNode.querySelector('.logicblockinputoutput_' + outputCounter);
                    if (existingNode != undefined) {
                        this.parentNode.removeChild(existingNode);
                    }

                    this.parentNode.insertBefore(outputLabel, this.nextSibling);
                    outputLabel.style.display = 'Block';
                }
            });
        }

        self.keyDownInDrawFlowWrapper = function keyDownInDrawFlowWrapper(e) {
            var rightClickedObj = this.node_selected;
            // right click
            if (disallowDelete(rightClickedObj)) {
                return true;
            }

            return this.orgKey(e);
        }

        self.contextmenuwrapper = function contextmenuwrapper(e) {

            var rightClickedObj = this.node_selected;
            // right click
            if (disallowDelete(rightClickedObj)) {
                return true;
            }

            return this.orgContextMenu(e);
        }

        // Must be done before setting up the observe properties
        editor.reroute = true;
        editor.editor_mode = 'edit';
        editor.contextmenu = self.contextmenuwrapper;
        editor.key = self.keyDownInDrawFlowWrapper;
        editor.start();


        $dyn.observe(this.updateBlocks, function (_data) {
            self.blockListCallBack(_data);
        });

        $dyn.observe(this.updateSingleNodeHtml, function (_data) {
            if (_data == '') {
                return;
            }
            self.updateSingleNodeHtmlCallBack(_data);
            self.updateLabelForInputOutput(false);
        });

        $dyn.observe(this.updateViewToJS, function (_data) {
            if (_data == '') {
                setTimeout(() => {
                    editor.clear();
                    self.toggleLoaderVisibility(false);
                }, 100);
                return;
            }            
            var importData = JSON.parse(_data);
            editor.import(importData);

            self.updateLabelForInputOutput(true);
        });


        $dyn.observe(this.updateEditorMode, function (_data) {
            editor.editor_mode = _data;

            let barZoomParent = editor.container.parentNode;
            let barZoom = barZoomParent.querySelector('.bar-zoom .icon-with-label');
            if (_data != '' && _data != 'edit') {
                barZoom.style.display = 'none';
            } else {
                barZoom.style.display = 'flex';
            }
        });

        $dyn.observe(this.SendUpdatingToJavascript, function (_data) {
            self.toggleLoaderVisibility(true);
        });

        $dyn.observe(this.SendNotUpdatingToJavascript, function (_data) {
            self.toggleLoaderVisibility(false);
        });

        $dyn.observe(this.SendNodeSelectedToJavascript, function (_data) {

            if (_data != '') {

                var nodeId = 'node-' + _data;
                var node = document.getElementById(nodeId);
                if (node != undefined) {
                    if (editor.node_selected != undefined) {
                        editor.node_selected.classList.remove('selected');
                    }
                    editor.node_selected = node; //consider if this is necessary
                    node.classList.add("selected");
                }
            }
        });       
   }

    $dyn.controls.TFMDrawFlowControl.prototype = $dyn.extendPrototype($dyn.ui.Control.prototype, {});
    
})();


function filterDrawflowBlocks(clickedButton)
{
    clickedButton.classList.toggle('categorySelected');
    var selectedCategoryButtons = $('.filter-btn.categorySelected');
    // Create an array of the IDs of the filter buttons
    var selectedCategoryButtonIds = selectedCategoryButtons.map(function () {
        return this.id;
    }).get();


    var dragFlowBlocks = $('.drag-drawflow');
    dragFlowBlocks.each(function (index, blockItem) {

        var drawFlowCategories = $(this).data('categories');
        var drawFlowCategoriesArray = drawFlowCategories.split(',');

        var containsMatch = false;
        drawFlowCategoriesArray.forEach(function (item) {
            // Check if the item is in the selected categories array
            if (selectedCategoryButtonIds.length == 0 || selectedCategoryButtonIds.includes(item)) {
                containsMatch = true;
            }
        });

        if (containsMatch) {
            $(blockItem).show();
        } else {
            $(blockItem).hide();
        }

    });
}

function drag(ev) {
    if (ev.type === "touchstart") {
        mobile_item_selec = ev.target.closest(".drag-drawflow").getAttribute('data-node');
    } else {
        ev.dataTransfer.setData("node", ev.target.getAttribute('data-node'));
    }
}

function drop(ev) {
    if (ev.type === "touchend") {
        var parentdrawflow = document.elementFromPoint(mobile_last_move.touches[0].clientX, mobile_last_move.touches[0].clientY).closest("#drawflow");
        if (parentdrawflow != null) {
            addNodeToDrawFlow(mobile_item_selec, mobile_last_move.touches[0].clientX, mobile_last_move.touches[0].clientY, ev.currentTarget.dynContext.current._serverId);
        }
        mobile_item_selec = '';
    } else {
        //var parentdrawflow = document.elementFromPoint(mobile_last_move.touches[0].clientX, mobile_last_move.touches[0].clientY).closest("#drawflow");
        ev.preventDefault();
        var data = ev.dataTransfer.getData("node");
        addNodeToDrawFlow(data, ev.clientX, ev.clientY, ev.currentTarget.dynContext.current._serverId);
    }
}

function addNodeToDrawFlow(name, pos_x, pos_y, serverId) {

    if (name == undefined || name == '') {
        return;
    }
    var myArray = name.split("|");
    var editorName = myArray[7];

    var editor = DrawFlowModule.getObject('dfeditor_' + serverId);
    if (editor == undefined || editor.editor_mode === 'fixed') {
        return false;
    }
    pos_x = pos_x * (editor.precanvas.clientWidth / (editor.precanvas.clientWidth * editor.zoom)) - (editor.precanvas.getBoundingClientRect().x * (editor.precanvas.clientWidth / (editor.precanvas.clientWidth * editor.zoom)));
    pos_y = pos_y * (editor.precanvas.clientHeight / (editor.precanvas.clientHeight * editor.zoom)) - (editor.precanvas.getBoundingClientRect().y * (editor.precanvas.clientHeight / (editor.precanvas.clientHeight * editor.zoom)));

    var boxText = myArray[4];
    if (boxText.length > 0) {
        boxText = `<div class="box">
            <p>`+ boxText + `</p>
                </div>`;
    }

    var logicBlock = `
            <div>
              <div class="title-box"><i class="fab fa-logicblock"></i><img src="`+ myArray[3] + `" title="` + myArray[1] + `"><b>` + myArray[1] + `</b></div>
                `+ boxText + `
            </div>
            `;
    editor.addNode('LogicBlock', myArray[5], myArray[6], pos_x, pos_y, 'LogicBlock', { "blockName": myArray[1], "className": myArray[2] }, logicBlock);
}

// Function to simulate a keyboard shortcut press
function simulateF2KeyPress() {

    $(document).trigger(jQuery.Event('keydown', { ctrlKey: true, which: 113 })); // 113 is the F2
}

function positionMobileWMS(ev) {
    mobile_last_move = ev;
}

function allowDrop(ev) {
    ev.preventDefault();
}