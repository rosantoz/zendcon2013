Ext.define('Zendcon.model.Speaker', {
    extend: 'Ext.data.Model',
    xtype: 'speakerModel',
    config: {
        fields: [
            'person_key',
            'first_name',
            'last_name',
            'company',
            'title',
            'bio',
            'photo'
        ]
    }
});