Ext.define('Zendcon.controller.Speaker', {
    extend: 'Ext.app.Controller',

    config: {
        refs: {
            speakerPanel: 'speakerPanel',
            speakers: 'speakers',
            speaker: 'speaker',
            speakerInfo: 'speakerPanel speakerInfo',
            sessions: 'speakerPanel speaker list'
        },
        control: {
            speakers: {
                itemtap: 'onSpeakerTap',
                activate: 'onSpeakersActivate'
            },
            sessions: {
                itemtap: 'onSessionTap'
            },
            speakerPanel: {
                activate: 'onSpeakerPanelActivate'
            }
        }
    },

    onSpeakerTap: function (list, idx, el, record) {
        var sessionStore = Ext.getStore('SpeakerSession'),
            speakerId = record.get('person_key');

        sessionStore.load();

        sessionStore.clearFilter(true);
        sessionStore.filterBy(function (session) {
            return speakerId == session.get('person_key');
        });

        if (!this.speaker) {
            this.speaker = Ext.widget('speaker');
        }

        var name = record.get('first_name') + ' ' + record.get('last_name');
        this.speaker.setTitle(name);
        this.getSpeakerPanel().push(this.speaker);
        this.getSpeakerInfo().setRecord(record);
    },

    onSessionTap: function (list, idx, el, record) {

        if (!this.sessionInfo) {
            this.sessionInfo = Ext.widget('sessionInfo');
        }

        this.sessionInfo.config.title = record.get('title');
        this.sessionInfo.setRecord(record);
        this.getSpeakerPanel().push(this.sessionInfo);
    },

    onSpeakersActivate: function () {
        if (this.speaker) {
            this.speaker.down('list').deselectAll();
        }
    },

    onSpeakerPanelActivate: function () {
        var speakerStore = Ext.getStore('Speaker');
        speakerStore.load();
    }
});