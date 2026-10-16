let fadeSpeed = 250;
let gridAvailable;
let gridSetup;
GlobalObj = {};

// create the layout for the menu item.
function createMainMenuItem(isStandard, pageId, icon, title)
{
    var menuItemNode = '<div ';

    if (isStandard) {
        menuItemNode += 'isdefaultitem="true"';
    }

    menuItemNode += ' class="grid-square" id="' + pageId + '" data-id="' + pageId + '" ondblclick="doubleClickAddMainMenuItem(this)" >' +
        '<div class="center">' +
        '<img class="menuicon" src="' + icon + '" data-src="' + icon + '" alt="' + pageId + '" title="' + title + '"/>' +
        '</div>' +
        '<div class="menutitle">' + title + '</div>';

    if (isStandard) {
        menuItemNode += '<img src="resources/images/starx.png" alt="Default icon" class="standardImg" />';
    }
    menuItemNode += '</div>';

    return menuItemNode;
}

// add the menu item list to the menugrid.
function addMainMenuItemsToDiv(menugrid, menuItemsList) {
    var i = 0;
    var menuItemsChild = '';
    menugrid.innerHTML = '';

    for (i = 0; i <= menuItemsList.length - 1; i++) {
        var item = menuItemsList[i];
        var pageId = item.parmPageId;
        var icon = item.parmIconName;
        var title = item.parmTitle;
        var isStandard = item.parmIsStandard;

        menuItemsChild += createMainMenuItem(isStandard, pageId, icon, title);
    }

    menugrid.innerHTML = menuItemsChild;
}

(function () {
    'use strict';
    $dyn.ui.defaults.TFMMenuMakerCtrl = {};
    $dyn.controls.TFMMenuMakerCtrl = function (data, element) {
        $dyn.ui.Control.apply(this, arguments);
        var self = this;
        $dyn.ui.applyDefaults(self, data, $dyn.ui.defaults.TFMMenuMakerCtrl);

        // Sets up the Sortable.js
        gridSetup = document.getElementById('menugrid-setup');
        new Sortable(gridSetup, {
            group: 'shared',
            animation: 150,
            ghostClass: 'blue-background-class'
        });

        gridAvailable = document.getElementById('menugrid-available');
        new Sortable(gridAvailable, {
            group: 'shared',
            animation: 150,
            ghostClass: 'blue-background-class'
        });

        // Receives the available menu items and add them to the gridAvailable.
        $dyn.observe(this.SendUpdatingToJavascript, function (_data) {
            var menuLoader = document.getElementById('menuloader');
            menuLoader.style.display = 'block';
        });

        // Receives the available menu items and add them to the gridAvailable.
        $dyn.observe(this.SendAvailableMenuItemsToJavascript, function (_data) {
            if (gridAvailable != undefined){
                gridAvailable.innerHTML = '';
            }
            
            if (_data == '') {
                return;
            }

            var availalbleMenuItemsList = $.parseJSON(_data, true);
            addMainMenuItemsToDiv(gridAvailable, availalbleMenuItemsList);
            var menuLoader = document.getElementById('menuloader');
            menuLoader.style.display = 'None';
        });

        // Receives the selected menu items (the menu setup) and adds it to the gridSetup.
        $dyn.observe(this.SendSelectedMenuItemsToJavascript, function (_data) {
            if (gridSetup != undefined) {
                gridSetup.innerHTML = '';
            }
            if (_data == '') {
                return;
            }
            var menuItemInSetupList = $.parseJSON(_data, true);
            addMainMenuItemsToDiv(gridSetup, menuItemInSetupList);
        });

        // calls the setMenuSetup javascript function. The request is received from the backend and the window.timeout make sure that the function can be called.
        $dyn.observe(this.SendSaveRequestToControlToJavaScript, function (_data) {
            if (_data == '') {
                return;
            }
            window.setTimeout(GlobalObj.setMenuSetup, 0);
        });

        GlobalObj.setMenuSetup = function () {
            var menuDivs = gridSetup.getElementsByTagName('div');
            var menuSetup = [];
            for (const div of menuDivs) {
                if (div.getAttribute('class') == 'grid-square') {
                    menuSetup.push(div.getAttribute("id"));
                }
            }
            var jsonStr = JSON.stringify(menuSetup, null, 4);
            var params = { _json: jsonStr };
            $dyn.callFunction(self.setMenuItemsSetup, self, params);
            return;
        }

        // Adds the default menu items to the menu setup from the menu available.
        GlobalObj.addDefaultMenuItems = function () {
            var childNodes = gridAvailable.childNodes;
            childNodes.forEach(function (node, index)
            {
                if (node.className == 'grid-square' && node.hasAttribute('isdefaultitem')) {
                    // Move to menu setup
                    GlobalObj.moveToSetupGrid(node);
                }
            }
            );
        }

        // Removes all menu items (divs) from the gridSetup
        GlobalObj.removeAllMenuItems = function () {
            var childNodes = gridSetup.childNodes;
            for (let index = childNodes.length - 1; index >= 0; index--) {
                const node = childNodes[index];
                if (node.className == 'grid-square') {
                    GlobalObj.removeFromSetupGrid(node);
                }
            }
        }

        // Moves the divElement to the grid. The top defines whether to add to the top or the bottom of the to-grid.
        GlobalObj.moveToGridId = function (divElement, grid, top) {
            $('[id="' + divElement.id + '"]').fadeOut(fadeSpeed, function () {
                if (top) {
                    grid.insertBefore(divElement, grid.firstChild);
                } else {
                    grid.append(divElement);
                }
                $('[id="' + divElement.id + '"]').fadeIn(fadeSpeed);
            });
        }

        GlobalObj.removeFromSetupGrid = function(divElement) {

            GlobalObj.moveToGridId(divElement, gridAvailable, true);
        }

        GlobalObj.moveToSetupGrid = function (divElement) {
            GlobalObj.moveToGridId(divElement, gridSetup, false);
        }

        // Replaces the content of the element found by the key with the translation received by the backend
        self.getTranslationCallBack = function (_sJSON) {
            var translation = $.parseJSON(_sJSON, true);
            var i = 0;
            var key = translation.parmKey;
            var tranlationValue = translation.parmTranslation;

            var elem = document.getElementById(key);
            if (elem != undefined) {
                elem.innerHTML = tranlationValue;
            }
        }

        setTimeout(() => {
                $dyn.callFunction(self.getTranslation, self, ['removeAll'], self.getTranslationCallBack);
        }, 0);

        setTimeout(() => {
            $dyn.callFunction(self.getTranslation, self, ['addDefaultMenuItems'], self.getTranslationCallBack);
        }, 0);

        // Asks the backend to replace the element id with a translation. The id of the element is the id of the translation.
    }

    $dyn.controls.TFMMenuMakerCtrl.prototype = $dyn.extendPrototype($dyn.ui.Control.prototype, {});
})();

// the menu items double click function. It will move the menu item from and to the set up grid.
function doubleClickAddMainMenuItem(divElement) {
    
    if (divElement.parentNode.id == 'menugrid-setup') {
        // add to the available menugrid
        GlobalObj.removeFromSetupGrid(divElement);
    } else
    {
        GlobalObj.moveToSetupGrid(divElement);
    }
}

