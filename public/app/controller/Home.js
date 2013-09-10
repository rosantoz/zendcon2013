Ext.define('Zendcon.controller.Home', {

    extend: 'Ext.app.Controller',

    config: {

        refs: {
            homePanelList: 'homePanel'
        },

        control: {
            'homePanel dataview': {
                itemtap: 'renderPanel'
            }
        }
    },

    renderPanel: function (list, index, element, record) {
        Ext.getCmp('mainView').setActiveItem(record.get('panel'));
    }
});
