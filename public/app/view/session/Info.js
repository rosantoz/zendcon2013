Ext.define('Zendcon.view.session.Info', {

    extend: 'Ext.Container',
    xtype : 'sessionInfo',

    config: {
        cls             : 'sessionInfo',
        scrollable      : true,
        styleHtmlContent: true,
        tpl             : Ext.create('Ext.XTemplate',
            '<div class="session-tpl">',
            '<div class="session-head">',
            '<div class="session-content">{title}</div>',
            '<div class="session-subtitle">{long_date} {start_time}-{end_time}</div>',
            '<div class="session-subtitle">{room}</div>',
            '</div>',
            '<div class="session-body">',
            '<div class="session-abstract">{abstract}</div>',
            '<div class="session-abstract"><strong>Track:</strong> {track}</div>',
            '<div class="session-abstract"><strong>Level:</strong> {level}</div>',
            '</div>',
            '</div>'
        )
    }
});
