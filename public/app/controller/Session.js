    Ext.define('Zendcon.controller.Session', {

    extend: 'Ext.app.Controller',

    config: {
        refs   : {
            sessions        : 'sessions',
            session         : 'session',
            sessionDay      : 'segmentedbutton',
            sessionInfo     : 'sessionPanel sessionInfo',
            sessionContainer: 'sessionPanel',

            sessionSpeaker: 'sessionPanel list',
            speaker       : 'sessionPanel speakers'

        },
        control: {
            sessionDay      : {
                toggle: 'onSessionDateChange'
            },
            sessions        : {
                initialize: 'initSessions',
                itemtap   : 'onSessionTap',
                activate  : 'onSessionsActivate'
            },
            speaker         : {
                itemtap: 'onSpeakerTap'
            },
            sessionContainer: {
                activate: 'onSessionPanelTap'
            }
        }
    },

    initSessions: function () {
        var firstButton = this.getSessionDay().getItems().items[0];
        this.getSessionDay().setPressedButtons(firstButton);
        this.filterByButton(firstButton);
    },

    onSessionDateChange: function (seg, btn, toggle) {
        if (toggle) {
            this.filterByButton(btn);
        }
    },

    filterByButton: function (btn) {
        if (this.getSessionSpeaker()) {
            this.getSessionSpeaker().deselectAll();
        }
        Ext.getStore('Session').clearFilter(true);
        Ext.getStore('Session').filter(function (record) {
            return record.get('date').substr(0, 5) == btn.config.day;
        });
    },

    onSessionTap: function (list, idx, el, record) {
        var speakerStore = Ext.getStore('SessionSpeaker');
        var speakerId = record.get('person_key');

        speakerStore.load();

        speakerStore.clearFilter(true);
        speakerStore.filterBy(function (speaker) {
            return speakerId == speaker.get('person_key');
        });

        if (!this.session) {
            this.session = Ext.widget('session');
        }

        this.session.setTitle(record.get('title'));
        this.getSessionContainer().push(this.session);
        this.getSessionInfo().setRecord(record);
    },

    onSpeakerTap: function (list, idx, el, record) {
        if (!this.speakerInfo) {
            this.speakerInfo = Ext.widget('speakerInfo', {
                scrollable: 'vertical'
            });
        }
        var fullName = record.get('first_name') + ' ' + record.get('last_name');
        this.speakerInfo.config.title = fullName;
        this.speakerInfo.setRecord(record);
        this.getSessionContainer().push(this.speakerInfo);
    },

    onSessionsActivate: function () {
        if (this.session) {
            this.session.down('speakers').deselectAll();
        }
    },

    onSessionPanelTap: function () {
        var sessionStore = Ext.getStore('Session');
        sessionStore.load();
    }
});
