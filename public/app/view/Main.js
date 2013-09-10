Ext.define('Zendcon.view.Main', {
    extend: 'Ext.tab.Panel',
    xtype: 'main',
    id: 'mainView',
    config: {
        tabBarPosition: 'bottom',

        items: [
            {
                xtype: 'homePanel'
            },
            {
                xtype: 'sessionPanel'
            },
            {
                xtype: 'speakerPanel'
            },
            {
                xtype: 'tweetPanel'
            },
            {
                xtype: 'infoPanel'
            }
        ]
    }

});