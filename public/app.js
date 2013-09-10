//@require @packageOverrides
Ext.application({
    name: 'Zendcon',

    viewport: {
        autoMaximize: true
    },

    requires: [
        'Ext.MessageBox'
    ],

    models: ['Session', 'Speaker'],

    controllers: ['Home', 'Session', 'Speaker', 'Tweet', 'Info'],

    views: [
        'Main', 'Home', 'Session', 'Speaker', 'Tweet',
        'session.List', 'session.Detail', 'session.Info',
        'speaker.List', 'speaker.Detail', 'speaker.Info',
        'info.Card', 'info.List', 'info.HtmlPage'
    ],

    stores: ['SessionSpeaker', 'SpeakerSession', 'Session', 'Speaker', 'Tweet'],

    infoPages: [
        {
            title: 'Conference Venue',
            xtype: 'htmlPage',
            url  : 'data/conference_venue.html'
        },
        {
            title: 'Santa Clara Convention Center',
            xtype: 'htmlPage',
            url  : 'data/santa_clara.html'
        },
        {
            title: 'Hotel Accomodations',
            xtype: 'htmlPage',
            url  : 'data/hotel_accomodations.html'
        },
        {
            title: 'PHP 2013 Overflow Hotel',
            xtype: 'htmlPage',
            url  : 'data/overflow_hotel.html'
        },
        {
            title: 'Transportation',
            xtype: 'htmlPage',
            url  : 'data/transportation.html'
        },
        {
            title: 'Local Travel',
            xtype: 'htmlPage',
            url  : 'data/local_travel.html'
        },
        {
            title     : 'Map',
            xtype     : 'map',
            mapOptions: {
                center   : new google.maps.LatLng(37.40440, -121.97538),
                mapTypeId: google.maps.MapTypeId.ROADMAP,
                zoom     : 15
            },
            listeners : {
                maprender: function () {
                    new google.maps.Marker({
                        position: this.getMap().center,
                        map     : this.getMap()
                    });
                }
            }
        },
        {
            title: 'Credits',
            xtype: 'htmlPage',
            url  : 'data/credits.html'
        }
    ],

    icon: {
        '57' : 'resources/icons/Icon.png',
        '72' : 'resources/icons/Icon~ipad.png',
        '114': 'resources/icons/Icon@2x.png',
        '144': 'resources/icons/Icon~ipad@2x.png'
    },

    isIconPrecomposed: true,

    startupImage: {
        '320x460'  : 'resources/startup/320x460.jpg',
        '640x920'  : 'resources/startup/640x920.png',
        '768x1004' : 'resources/startup/768x1004.png',
        '748x1024' : 'resources/startup/748x1024.png',
        '1536x2008': 'resources/startup/1536x2008.png',
        '1496x2048': 'resources/startup/1496x2048.png'
    },

    launch: function () {
        Ext.fly('appLoadingIndicator').destroy();
        Ext.Viewport.add(Ext.create('Zendcon.view.Main'));
    }
});
