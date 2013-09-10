Ext.define('Zendcon.controller.Tweet', {
    extend: 'Ext.app.Controller',

    config: {
        refs   : {
            title: 'tweetPanel titlebar'
        },
        control: {
            tweetPanel: {
                activate: 'onActivate'
            }
        }
    },

    onActivate: function () {
        if (!this.loadedTweets) {

            this.getTitle().setTitle('#zendcon');

            Ext.getStore('Tweet').load();

            this.loadedTweets = true;
        }
    }

});
