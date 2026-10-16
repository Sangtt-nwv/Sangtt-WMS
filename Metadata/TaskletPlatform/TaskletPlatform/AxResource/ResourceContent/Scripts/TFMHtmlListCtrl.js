let mobhtmllist_fadeSpeed = 250;
let listitems_gridContext;
let mobhtmllist_lastSelected;
mobhtmllist_GlobalObj = {};
let listItemsData = {};
let emptyFilterHtml = '';

// create the layout for the item.
function createListItem(listItem)
{
    var pageId = listItem.parmListItemId;
    var icon = listItem.parmIconName;
    var title = listItem.parmTitle;
    var line2 = listItem.parmLine2;
    var line3 = listItem.parmLine3;
    var line4 = listItem.parmLine4;
    var line4Class = listItem.parmLine4Class;

    var itemNode = '<div class="item-grid-square';

    itemNode += '" id="' + pageId + '" data-id="' + pageId + '" onclick="mobhtmllist_GlobalObj.selectListItem(this)" >' +
        '<div class="items_icon_div">';
    itemNode += '<img class="items_icon" src="' + icon + '" data-src="' + icon + '" alt="' + pageId + '" title="' + title + '"/>' +
        '</div>' +
        '<div class="items_right_area">' +
        '<span class="items_line items_title">' + title + '</span>' +
        '<span class="items_line items_line2">' + line2 + '</span>' +
        '<span class="items_line items_line3">' + line3 + '</span>' +
        '<span class="items_line items_line4 ' + line4Class +'">' + line4 + '</span>' +
        '</div>';
        
    itemNode += '</div></div>';

    return itemNode;
}

// add the item list to the grid.
function addItemsToDiv(listgrid, itemsList) {
    var i = 0;
    var itemsChild = '';
    listgrid.innerHTML = '';

    for (i = 0; i <= itemsList.length - 1; i++) {
        var item = itemsList[i];
        itemsChild += createListItem(item);
    }
    listgrid.innerHTML = itemsChild;
}

(function () {
    'use strict';
    $dyn.ui.defaults.TFMHtmlListCtrl = {};
    $dyn.controls.TFMHtmlListCtrl = function (data, element) {
        $dyn.ui.Control.apply(this, arguments);
        var self = this;
        $dyn.ui.applyDefaults(self, data, $dyn.ui.defaults.TFMHtmlListCtrl);

        listitems_gridContext = document.getElementById('listitems');

        mobhtmllist_GlobalObj.toggleLoaderVisibility = function (_visible) {
            var loader = document.getElementById('listitemloader');
            loader.style.display = _visible ? 'block' : 'None';
        }

        mobhtmllist_GlobalObj.toggleLoaderVisibility(true);

        mobhtmllist_GlobalObj.selectListItem = function (divElement) {
            if (mobhtmllist_lastSelected != undefined) {
                mobhtmllist_lastSelected.toggleClass('transform-active');
            }
            mobhtmllist_lastSelected = $('#' + $.escapeSelector(divElement.id))
            mobhtmllist_lastSelected.toggleClass('transform-active');

            // inform FO that an item has been selected
            $dyn.callFunction(self.selectListItem, self, [divElement.id]);
        }

        // Receives the available menu items and add them to the gridAvailable.
        $dyn.observe(this.SendUpdatingToJavascript, function (_data) {
            mobhtmllist_GlobalObj.toggleLoaderVisibility(true);
        });

        // Receives the available menu items and add them to the gridAvailable.
        $dyn.observe(this.SendItemsToJavascript, function (_data) {
            if (listitems_gridContext != undefined) {
                listitems_gridContext.innerHTML = '';
            } 
            
            if (_data == '') {
                return;
            }
            var itemsList = $.parseJSON(_data, true);
            listitems_gridContext.innerHTML = emptyFilterHtml;

            addItemsToDiv(listitems_gridContext, itemsList);

            mobhtmllist_GlobalObj.toggleLoaderVisibility(false);
        });

        // Sets the active item.
        $dyn.observe(this.setActiveItemToJavascript, function (_data) {
            if (_data == '') {
                return;
            }
            var selectedElement = document.getElementById(_data);
            if (selectedElement != undefined) {
                selectedElement.classList.add('transform-active');
            }
        });
    }

    $dyn.controls.TFMHtmlListCtrl.prototype = $dyn.extendPrototype($dyn.ui.Control.prototype, {});
})();


