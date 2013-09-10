Ext.define('Zendcon.store.Tweet', {
    extend: 'Ext.data.Store',

    requires: [
        'Ext.data.proxy.JsonP'
    ],
    config  : {
        fields: ['screen_name', 'profile_image_url', 'text', 'created_at'],

        pageSize: 50,

        proxy: {
            type: 'ajax',
            url : '/conference/twitter',

           qParam : '#zendcon',

            reader: {
                type        : 'json',
                rootProperty: 'statuses'
            }
        }
    }
});
