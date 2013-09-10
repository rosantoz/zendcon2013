Ext.define('Zendcon.view.speaker.Detail', {

    extend: 'Ext.Container',
    xtype: 'speaker',

    config: {

        layout: 'vbox',
        title: '',

        items: [
            {
                flex: 1,
                layout: 'fit',
                scrollable: 'vertical',
                xtype: 'speakerInfo'
            },
            {
                xtype: 'component',
                cls: 'speaker-line',
                html: 'Sessions'
            },
            {
                flex: 1,
                xtype: 'list',
                store: 'SpeakerSession',
                itemTpl: [
                    '{title}'
                ]
            }
        ]

    }
});
