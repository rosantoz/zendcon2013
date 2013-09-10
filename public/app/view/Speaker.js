Ext.define('Zendcon.view.Speaker', {
    extend: 'Ext.navigation.View',
    xtype : 'speakerPanel',

    config: {
        title  : 'Speakers',
        iconCls: 'zc_speakers',

        autoDestroy: false,

        items: {
            xtype     : 'speakers',
            title     : 'Speakers',
            store     : 'Speaker',
            grouped   : true,
            pinHeaders: false,
            indexBar  : true,
            masked    : {
                xtype: 'loadmask'
            }
        }
    }

});