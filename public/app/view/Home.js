Ext.define('Zendcon.view.Home', {
    extend: 'Ext.Container',
    xtype : 'homePanel',

    config: {
        title           : 'Home',
        iconCls         : 'zc_home',
        styleHtmlContent: true,
        layout          : {
            type : 'vbox',
            align: 'center',
            pack : 'justify'
        },
        defaults        : {
            layout: {
                type : 'hbox',
                align: 'middle'
            }
        },

        items: [
            {
                xtype : 'container',
                html  : '<div align="center"><img src="/img/zendcon.png" /></div>',
                height: 120
            },
            {
                minWidth: '300px',
                flex    : 1,
                xtype   : 'dataview',
                inline  : true,
                cls     : 'dashboard',
                padding : '0 0 0 50',
                store   : {
                    fields: ['name', 'icon', 'panel'],
                    data  : [
                        {name: 'Schedule', icon: '&#xe002;', panel: 'sessionPanel'},
                        {name: 'Speakers', icon: '&#xe001', panel: 'speakerPanel'},
                        {name: 'Tweets', icon: '&#xe003;', panel: 'tweetPanel'},
                        {name: 'Info', icon: '&#xe005;', panel: 'infoPanel'}
                    ],
                    autoLoad: true
                },
                itemTpl : '<div class="button-container">' +
                          '<span class="button-icon">{icon}</span>' +
                          '<span class="button-label">{name}</span>' +
                          '</div>'
            }
        ]
    }
});
