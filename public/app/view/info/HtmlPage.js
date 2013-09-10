Ext.define('Zendcon.view.info.HtmlPage', {

    extend: 'Ext.Container',
    xtype : 'htmlPage',

    config: {
        scrollable      : 'vertical',
        cls             : 'htmlPage',
        scrollable      : true,
        styleHtmlContent: true
    },

    initialize: function () {

        Ext.Ajax.request({
            url    : this.config.url,
            success: function (rs) {
                this.setHtml(rs.responseText);
            },
            scope  : this
        });
    }
});
