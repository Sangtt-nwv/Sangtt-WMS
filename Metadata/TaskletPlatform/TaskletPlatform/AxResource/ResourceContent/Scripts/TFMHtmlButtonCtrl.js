(function () {
    'use strict';
    $dyn.ui.defaults.TFMHtmlButtonCtrl = {};
    $dyn.controls.TFMHtmlButtonCtrl = function (data, element) {
        $dyn.ui.Control.apply(this, arguments);
        var self = this;
        $dyn.ui.applyDefaults(self, data, $dyn.ui.defaults.TFMHtmlButtonCtrl);

        self.conditionSetUp = $dyn.observable(true);
    }

    $dyn.controls.TFMHtmlButtonCtrl.prototype = $dyn.extendPrototype($dyn.ui.Control.prototype, {
        click: function (event) {
            event.preventDefault();
            $dyn.callFunction(this.Clicked, this, { _controlName: this._name })
        }
    });
})();
