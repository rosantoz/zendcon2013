Ext.define('Zendcon.store.Session', {
    extend: 'Ext.data.Store',
    xtype: 'sessionStore',

    config: {
        model: 'Zendcon.model.Session',
        grouper: {
            groupFn: function (record) {
                var start_time = record.get('start_time');
                var end_time = record.get('end_time');
                return start_time + '-' + end_time;
            }
        },
        proxy: {
            type: "ajax",
            url: "/conference/session",
            reader: {
                type: "json",
                rootProperty: "sessions"
            }
        },
        autoLoad: false
    }
});