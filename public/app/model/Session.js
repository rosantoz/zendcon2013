Ext.define('Zendcon.model.Session', {
    extend: 'Ext.data.Model',
    xtype: 'sessionModel',
    config: {
        fields: [
            'start_time',
            'end_time',
            'room',
            'session_key',
            'person_key',
            'title',
            'abstract',
            'first_name',
            'last_name',
            'date',
            'long_date',
            'level',
            'track'
        ]
    }
});