Ext.define('Zendcon.controller.Info', {

    extend: 'Ext.app.Controller',

    config: {

        refs: {
            infoPanel: 'infoPanel'
        },

        control: {
            infoList: {
                itemtap: 'onInfoItemTap',
                activate: 'onInfoListActivate'
            }
        }
    },

    onInfoListActivate: function(list) {
        list.deselectAll();
    },

    onInfoItemTap: function(list, idx) {
        this.getInfoPanel().push(Zendcon.app.config.infoPages[idx]);
    }

});
