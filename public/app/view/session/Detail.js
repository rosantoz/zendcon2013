Ext.define('Zendcon.view.session.Detail', {

    extend: 'Ext.Container',
    xtype: 'session',

    config: {

        layout: 'vbox',
        title: '',

        items: [
            {
                flex: 4,
                layout: 'fit',
                scrollable: 'vertical',
                xtype: 'sessionInfo'
            },
            {
                xtype: 'component',
                cls: 'speaker-line',
                html: 'Speaker'
            },
            {
                flex: 1,
                xtype: 'speakers',
                store: 'SessionSpeaker'
            }
        ]

    }
});
