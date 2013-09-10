Ext.define('Zendcon.view.Session', {
    extend: 'Ext.NavigationView',
    xtype : 'sessionPanel',

    config: {
        title  : 'Schedule',
        iconCls: 'zc_schedule',

        autoDestroy: false,

        items: {
            xtype     : 'sessions',
            title     : 'Schedule',
            store     : 'Session',
            grouped   : true,
            pinHeaders: true,
            masked    : {
                xtype: 'loadmask'
            }
        },

        autoLoad: false
    }
});