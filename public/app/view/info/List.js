Ext.define('Zendcon.view.info.List', {

    extend: 'Ext.List',
    xtype: 'infoList',

    config: {
        title: 'Info',
        ui: 'round',
        itemTpl: [ '{title}' ]
    },

    initialize: function() {
        this.callParent();
        this.setData(Zendcon.app.infoPages);
    }
});
