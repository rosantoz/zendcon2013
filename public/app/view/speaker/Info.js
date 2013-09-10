Ext.define('Zendcon.view.speaker.Info', {

    extend: 'Ext.Container',
    xtype : 'speakerInfo',

    config: {

        scrollable      : true,
        styleHtmlContent: true,

        tpl: Ext.create('Ext.XTemplate',
            '<div class="overview-tpl">',
            '<div class="overview-head">',
            '<div class="overview-avatar" style="background-image:url(/img/speakers/',
            '{photo}',
            ')"></div>',
            '<div class="overview-content">{first_name} {last_name}</div>',
            '<div class="overview-subtitle">{title}, {company}</div>',
            '</div>',
            '<div class="overview-body">',
            '<div class="overview-bio">{bio}</div>',
            '</div>',
            '</div>'
        )
    }
});
