Ext.define('Zendcon.store.SessionSpeaker', {
    extend: 'Ext.data.Store',
    xtype : 'sessionSpeakerStore',
    config: {
        model   : 'Zendcon.model.Speaker',
        proxy   : {
            type  : "ajax",
            url   : "/conference/person",
            reader: {
                type        : "json",
                rootProperty: "speakers"
            }
        },
        autoLoad: false
    }
});