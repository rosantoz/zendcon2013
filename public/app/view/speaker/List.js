Ext.define('Zendcon.view.speaker.List', {

    extend: 'Ext.List',

    xtype: 'speakers',

    config: {
        variableHeights: true,
        useSimpleItems : true,

        itemTpl: '<div class="list-tpl">' +
                 '<div class="list-avatar" style="background-image:url(/img/speakers/' +
                 '{photo}' +
                 ')"></div>' +
                 '<div class="list-content">{first_name} {last_name}</div>' +
                 '<div class="list-subtitle">{title}, {company}</div>' +
                 '</div>'
    }

});
