Ext.define('Zendcon.view.info.Card', {

    extend: 'Ext.NavigationView',
    xtype : 'infoPanel',

    requires: ['Ext.Map'],

    config: {

        title  : 'Info',
        iconCls: 'zc_about',

        autoDestroy: false,

        items: [
            {
                xtype: 'infoList'
            }
        ]
    }
});