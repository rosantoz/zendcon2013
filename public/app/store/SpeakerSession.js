Ext.define('Zendcon.store.SpeakerSession', {
    extend: 'Ext.data.Store',
    xtype : 'speakerSessionStore',
    config: {
        model   : 'Zendcon.model.Session',
        proxy   : {
            type  : "ajax",
            url   : "/conference/session",
            reader: {
                type        : "json",
                rootProperty: "sessions"
            }
        },
        autoLoad: false
    }
});