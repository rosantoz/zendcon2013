Ext.define('Zendcon.view.Tweet', {

    extend  : 'Ext.List',
    requires: [
        'Ext.plugin.PullRefresh',
        'Ext.plugin.ListPaging'
    ],

    xtype: 'tweetPanel',

    config: {
        variableHeights: true,
        title          : 'Tweets',
        iconCls        : 'zc_tweets',
        cls            : 'tweets',

        items: [
            {
                docked: 'top',
                xtype : 'titlebar'
            }
        ],

        store           : 'Tweet',
        limit           : 50,
        disableSelection: true,

        masked: {
            xtype: 'loadmask'
        },

        plugins: [
            { type: 'listpaging' },
            { type: 'pullrefresh' }
        ],

        emptyText: '<p class="no-searches">No tweets found matching that search</p>',

        itemTpl: Ext.create('Ext.XTemplate',
            '<img src="{profile_image_url}" width="48" height="48" />',
            '<div class="tweet">',
            '<span class="posted">{[this.posted(values.created_at)]}</span>',
            '<h2>@{screen_name}</h2>',
            '<p>{text}</p>',
            '</div>',
            {
                posted: function (date) {
                    try {
                        var now = Math.ceil(Number(new Date()) / 1000),
                            dateTime = Math.ceil(Number(new Date(date)) / 1000),
                            diff = now - dateTime,
                            str;

                        if (diff < 60) {
                            return String(diff) + ' seconds ago';
                        } else if (diff < 3600) {
                            str = String(Math.ceil(diff / (60)));
                            return str + (str == "1" ? ' minute' : ' minutes') + ' ago';
                        } else if (diff < 86400) {
                            str = String(Math.ceil(diff / (3600)));
                            return str + (str == "1" ? ' hour' : ' hours') + ' ago';
                        } else if (diff < 60 * 60 * 24 * 365) {
                            str = String(Math.ceil(diff / (60 * 60 * 24)));
                            return str + (str == "1" ? ' day' : ' days') + ' ago';
                        } else {
                            return Ext.Date.format(new Date(date), 'jS M \'y');
                        }
                    } catch (e) {
                        return '';
                    }
                }
            }
        )
    }
});