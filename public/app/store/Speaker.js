Ext.define('Zendcon.store.Speaker', {
    extend: 'Ext.data.Store',
    xtype: 'speakerStore',

    config: {
        model: 'Zendcon.model.Speaker',
        sorters: 'speaker',
        grouper: {
            groupFn: function (record) {
                return record.get('first_name').substr(0, 1);
            }
        },
        proxy: {
            type: "ajax",
            url: "/conference/person",
            reader: {
                type: "json",
                rootProperty: "speakers"
            }
        },
        autoLoad: false

    }

});