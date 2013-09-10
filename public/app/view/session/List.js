Ext.define('Zendcon.view.session.List', {

    extend  : 'Ext.List',
    requires: 'Ext.SegmentedButton',

    xtype: 'sessions',

    config: {
        items          : [
            {
                docked: 'top',
                xtype : 'toolbar',
                ui    : 'gray',

                items: [
                    {
                        width       : '100%',
                        defaults    : {
                            flex: 1
                        },
                        xtype       : 'segmentedbutton',
                        allowDepress: false
                    }
                ]
            }
        ],
        variableHeights: true,
        useSimpleItems : true,
        itemTpl        : '</div><div>{title}</div>' +
                         '<div><i>{first_name} {last_name}</i></div>' +
                         '<div>{room}</div>'

    },

    initialize: function () {
        this.callParent();

        var segmentedButton = this.down('segmentedbutton');

        var days = new Array();
        days[0] = {
            day : "07/10",
            text: "Mon 7"
        };
        days[1] = {
            day : "08/10",
            text: "Tue 8"
        };
        days[2] = {
            day : "09/10",
            text: "Wed 9"
        };
        days[3] = {
            day : "10/10",
            text: "Thu 10"
        };

        Ext.Array.each(days, function (day) {
            segmentedButton.add(day);
        });
    }
});
