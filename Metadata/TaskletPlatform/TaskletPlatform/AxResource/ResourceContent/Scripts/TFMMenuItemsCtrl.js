let menuitems_fadeSpeed = 250;
let menuitems_gridContext;
let menuitems_gridPromoted;
let menuitems_lastSelected;
let menuitems_addButton;
let menuitems_saveButton;
menuitems_GlobalObj = {};
let menuItemsData = {};

// create the layout for the menu item.
function createMenuItem(isDisabled, isOffline, isMandatory, isStandard, pageId, icon, title)
{
    var menuItemNode = '<div class="menuitem-grid-square';

    if (isDisabled) {
        menuItemNode += ' grayed';
    }
    //
    menuItemNode += '" id="' + pageId + '" data-id="' + pageId + '"onclick="selectMenuItem(this)" >' +
        '<div class="center">';

    if (!isMandatory) {
        menuItemNode += '<button class="delete-btn" onclick="deleteMenuItem(event, this)" >'
            + '<img src="data:image/svg+xml,%3Csvg version =\'1.1\' id=\'Layer_1\' xmlns=\'http://www.w3.org/2000/svg\' xmlns:xlink=\'http://www.w3.org/1999/xlink\' x=\'0px\' y=\'0px\' viewBox=\'0 0 362 564\' width=\'16px\' style=\'enable-background:new 0 0 362 564;\' xml:space=\'preserve\'%3E%3Cstyle type=\'text/css\'%3E .st0%7Bfill-rule:evenodd;clip-rule:evenodd;fill:%23000000;%7D%0A%3C/style%3E%3Cg%3E%3Cpath class=\'st0\' d=\'M24.2,165.7l32.3,367.9h235.4l32.3-367.9L24.2,165.7L24.2,165.7z M241.8,243.3c0.3-4.2,4-7.3,8.1-7 c4.2,0.3,7.3,3.9,7,8.1L240.7,456c-0.3,4.2-3.9,7.3-8.1,7s-7.3-4-7-8.1L241.8,243.3z M91.6,244.5c-0.3-4.2,2.8-7.8,7-8.1 s7.8,2.8,8.1,7L123,454.9c0.3,4.2-2.8,7.8-7,8.1c-4.2,0.3-7.8-2.8-8.1-7L91.6,244.5z M165.1,243.9c0-4.2,3.4-7.6,7.6-7.6 s7.6,3.4,7.6,7.6v211.5c0,4.2-3.4,7.6-7.6,7.6s-7.6-3.4-7.6-7.6V243.9z\'/%3E%3Cpath class=\'st0\' d=\'M25.7,73.5l308,82.5l13.2-49.3l-99-26.5l3.1-11.5c2-7.4,0.9-14.9-2.4-21.1c-3.4-6.3-9.1-11.2-16.4-13.1 L174.3,19c-7.2-1.9-14.7-0.6-20.7,3.2c-6,3.7-10.6,9.7-12.6,17.1l-3.1,11.5l-99-26.5L25.7,73.5z M235.2,54.8c1.6,2.9,2,6.4,1.1,10 l-3.1,11.5l-80.6-21.6l3.1-11.5c1-3.5,3.1-6.4,5.9-8.1c2.6-1.6,5.8-2.2,8.8-1.4l57.9,15.5C231.3,50,233.8,52.1,235.2,54.8 L235.2,54.8z\'/%3E%3C/g%3E%3C/svg%3E" '
            + ' alt="close button" style="margin-left: 2px;"\> <span class="sr-only">Delete</span></button > ';
    }

    if (isOffline) {
        menuItemNode += '<img class="offlineicon" src="resources/images/offline.png" alt="Offline menu items are only active when the page is set in offline mode" title="Offline menu items are only active when the page is set in offline mode"></img>';
    }

    menuItemNode +=     '<img class="menuitems_menuicon" src="' + icon + '" data-src="' + icon + '" alt="' + pageId + '" title="' + title + '"/>' +
        '</div>' +
        '<div class="menuitemstitle">' + title + '</div>';

    menuItemNode += '</div>';

    return menuItemNode;
}

// add the menu item list to the menugrid.
function addMenuItemsToDiv(menugrid, menuItemsList) {
    var i = 0;
    var menuItemsChild = '';
    menugrid.innerHTML = '';

    for (i = 0; i <= menuItemsList.length - 1; i++) {
        var item = menuItemsList[i];
        var pageId = item.parmPageId;
        var icon = item.parmIconName;
        var title = item.parmTitle;
        var isStandard = item.parmIsStandard;

        if (pageId != undefined)
        {
            menuItemsChild += createMenuItem(item.parmIsHide || (item.parmIsOffline && !item.parmPageIsSetupForOffline), item.parmIsOffline, item.parmIsMandatory, isStandard, pageId, icon, title);
            menuItemsData[pageId] = item;
        }
    }

    menugrid.innerHTML = menuItemsChild;
}

(function () {
    'use strict';
    $dyn.ui.defaults.TFMMenuItemsCtrl = {};
    $dyn.controls.TFMMenuItemsCtrl = function (data, element) {
        $dyn.ui.Control.apply(this, arguments);
        var self = this;
        $dyn.ui.applyDefaults(self, data, $dyn.ui.defaults.TFMMenuItemsCtrl);

        menuitems_addButton = document.getElementById('addMenuItemButton');
        menuitems_saveButton = document.getElementById('saveSortingSetupButton');

        menuitems_GlobalObj.onSortableChange = function (evt) {
            menuitems_addButton.classList.add('hide');
            menuitems_saveButton.classList.remove('hidden');
            setTimeout(() => menuitems_saveButton.classList.remove('hide'), 450);
        }

        menuitems_GlobalObj.toggleMenuLoaderVisibility = function (_visible) {
            var menuLoader = document.getElementById('menuitemloader');
            menuLoader.style.display = _visible ? 'block' : 'None';
        }

        menuitems_GlobalObj.toggleMenuLoaderVisibility(true);

        // Sets up the Sortable.js
        menuitems_gridPromoted = document.getElementById('menuitems-promoted-setup');
        new Sortable(menuitems_gridPromoted, {
            group: 'shared',
            animation: 150,
            ghostClass: 'blue-background-class',
            onChange: menuitems_GlobalObj.onSortableChange
        });

        menuitems_gridContext = document.getElementById('menuitems-context');
        new Sortable(menuitems_gridContext, {
            group: 'shared',
            animation: 150,
            ghostClass: 'blue-background-class',
            onChange: menuitems_GlobalObj.onSortableChange
        });

        // Receives the available menu items and add them to the gridAvailable.
        $dyn.observe(this.SendUpdatingToJavascript, function (_data) {
            menuitems_GlobalObj.toggleMenuLoaderVisibility(true);
            menuitems_saveButton.classList.add('hide');
            menuitems_saveButton.classList.add('hidden');
            setTimeout(() => menuitems_addButton.classList.remove('hide'), 450);

        });

        // Receives the available menu items and add them to the gridAvailable.
        $dyn.observe(this.SendAvailableMenuItemsToJavascript, function (_data) {
            if (menuitems_gridContext != undefined){
                menuitems_gridContext.innerHTML = '';
            }
            
            if (_data == '') {
                setTimeout(() => { menuitems_GlobalObj.toggleMenuLoaderVisibility(false); }, 200);
                return;
            }

            var availalbleMenuItemsList = $.parseJSON(_data, true);
            addMenuItemsToDiv(menuitems_gridContext, availalbleMenuItemsList);

            setTimeout(() => { menuitems_GlobalObj.toggleMenuLoaderVisibility(false); }, 1000);
        });

        // Receives the selected menu items (the menu setup) and adds it to the gridSetup.
        $dyn.observe(this.SendSelectedMenuItemsToJavascript, function (_data) {
            if (menuitems_gridPromoted != undefined) {
                menuitems_gridPromoted.innerHTML = '';
            }
            if (_data == '') {
                return;
            }
            var menuItemInSetupList = $.parseJSON(_data, true);
            addMenuItemsToDiv(menuitems_gridPromoted, menuItemInSetupList);
        });

        // Calls the setMenuSetup javascript function. The request is received from the backend and the window.timeout make sure that the function can be called.
        $dyn.observe(this.SendSaveRequestToControlToJavaScript, function (_data) {
            if (_data == '') {
                return;
            }
            window.setTimeout(()=> menuitems_GlobalObj.setMenuSetup, 0);
        });

        // Sets the active menu item.
        $dyn.observe(this.setActiveMenuItemsToJavascript, function (_data) {
            if (_data == '') {
                return;
            }
            
            var selectedElement = $('#' + $.escapeSelector(_data) + '.menuitem-grid-square');
            if (selectedElement != undefined) {
                selectedElement[0].classList.remove('transform-active');
                selectedElement[0].classList.add('transform-active');
            }
        });

        // Saves the menu sorting setup by getting all menuitems and send them to the backend.
        menuitems_GlobalObj.setMenuSetup = function () {

            let menuItemsSetupData = [];

            // Get the promoted items ids
            var menuDivs = menuitems_gridPromoted.getElementsByTagName('div');
            for (const div of menuDivs) {
                if (div.classList.contains('menuitem-grid-square')) {
                    var menuItemId = div.getAttribute("id");
                    var menuItem = menuItemsData[menuItemId];
                    menuItem.parmPromoted = true;
                    menuItem.parmIconName = '';
                    menuItemsSetupData.push(menuItem);
                }
            }
            // Get the non-promoted items ids
            menuDivs = menuitems_gridContext.getElementsByTagName('div');
            for (const div of menuDivs) {
                if (div.classList.contains('menuitem-grid-square')) {
                    var menuItemId = div.getAttribute("id")
                    var menuItem = menuItemsData[menuItemId];
                    menuItem.parmIconName = '';
                    menuItem.parmPromoted = false;
                    menuItemsSetupData.push(menuItem);
                }
            }
            var _jsonStr = JSON.stringify(menuItemsSetupData, null, 4);

            var params = { _jsonStr };
            $dyn.callFunction(self.setMenuItemsSortingSetup, self, params);

            menuitems_saveButton.classList.add('hide');
            menuitems_saveButton.classList.add('hidden');
            setTimeout(() => menuitems_addButton.classList.remove('hide'), 450);
            return;
        }

        // sets the selected menu ition on the control (backend)
        menuitems_GlobalObj.setSelectedMenuItemOnControl = function (divElement)
        {
            $dyn.callFunction(self.setSelectedMenuItem, self, [divElement.id]);
        }

        // Add menu items to the menu setup from the menu available.
        menuitems_GlobalObj.addMenuItemClick = function () {
            $dyn.callFunction(self.addMenuItem, self, ['value']);
        }

        // Moves the divElement to the grid. The top defines whether to add to the top or the bottom of the to-grid.
        menuitems_GlobalObj.moveToGridId = function (divElement, grid, top) {
            $('[id="' + $.escapeSelector(divElement.id) + '"].menuitem-grid-square').fadeOut(menuitems_fadeSpeed, function () {
                if (top) {
                    grid.insertBefore(divElement, grid.firstChild);
                } else {
                    grid.append(divElement);
                }
                $('[id="' + $.escapeSelector(divElement.id) + '"].menuitem-grid-square').fadeIn(menuitems_fadeSpeed);
            });
        }

        menuitems_GlobalObj.removeFromSetupGrid = function(divElement) {

            menuitems_GlobalObj.moveToGridId(divElement, menuitems_gridContext, true);
        }

        menuitems_GlobalObj.moveToSetupGrid = function (divElement) {
            menuitems_GlobalObj.moveToGridId(divElement, menuitems_gridPromoted, false);
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

        // Asks the backend to replace the element id with a translation. The id of the element is the id of the translation.
        setTimeout(() => {
            $dyn.callFunction(self.getTranslation, self, ['addMenuItem'], self.getTranslationCallBack);
        }, 0);

        setTimeout(() => {
            $dyn.callFunction(self.getTranslation, self, ['saveSortingSetupButton'], self.getTranslationCallBack);
        }, 0);
    }

    $dyn.controls.TFMMenuItemsCtrl.prototype = $dyn.extendPrototype($dyn.ui.Control.prototype, {});
})();

// the menu items double click function. It will move the menu item from and to the set up grid.
function menuItemDoubleClickAdd(divElement) {
    if (divElement.parentNode.id == 'menuitems-promoted-setup') {
        // add to the available menugrid
        menuitems_GlobalObj.removeFromSetupGrid(divElement);
    } else {
        menuitems_GlobalObj.moveToSetupGrid(divElement);
    }
    menuitems_GlobalObj.onSortableChange(undefined);
}

function selectMenuItem(divElement) {
    if (menuitems_lastSelected != undefined) {
        menuitems_lastSelected.toggleClass('transform-active');
    }

    menuitems_lastSelected = $('[id="' + $.escapeSelector(divElement.id) + '"].menuitem-grid-square');
    menuitems_lastSelected.toggleClass('transform-active');

    // inform FO that an item has been selected
    menuitems_GlobalObj.setSelectedMenuItemOnControl(divElement);
}

function deleteMenuItem(event, divElement) {
    divElement.parentNode.parentNode.parentNode.removeChild(divElement.parentNode.parentNode);
    event.stopPropagation();
    menuitems_GlobalObj.onSortableChange(undefined);
}
