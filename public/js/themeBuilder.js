var  DEThemeBuilderUrl 	= 'http://developerextensions.com/demo/senchaThemeBuilder/themeBuilder/action.php';
Ext.Ajax.timeout 		= 1200000;
//var  DEThemeBuilderUrl 		= window.location.origin+'/senchaThemeBuilder/themeBuilder/action.php';
var  DEThemeBuilderVersion 	= '1.0';
var  DEPlatform  			= Ext.filterPlatform?(Ext.filterPlatform('blackberry')?'blackberry': Ext.filterPlatform('ie10')?'ie10':'sencha'):'sencha';
function DEGetSdkName(){
	if(this.versionString){
		return this.versionString;
	}
	var version 		= Ext.getVersion();
	this.versionString 	= 'sencha'+version.getMajor()+'.'+version.getMinor();
	return this.versionString;
}
Ext.define('Ext.ux.DEThemeBuilderRecord', {
	extend: 'Ext.data.Model',
	config: {
		fields:[
			{name:'id'},
			{name:'date', 					type:'date'},
			{name:'base-color', 			type:'string'},
			{name:'page-bg-color', 			type:'string'},
			{name:'form-bg-color', 			type:'string'},
			{name:'active-color', 			type:'string'},
			{name:'confirm-color', 			type:'string'},
			{name:'neutral-color', 			type:'string'},
			{name:'alert-color', 			type:'string'},
			{name:'basic-slider', 			type:'boolean'},
			{name:'include-highlights', 	type:'boolean'},
			{name:'include-default-icons', 	type:'boolean'},
			{name:'base-gradient', 			type:'string'},
			{name:'list-border-color', 		type:'string'},
			{name:'form-input-color', 		type:'string'}
		],
		proxy: {
			type:'localstorage',
			id:'DE.ThemeBuilder'
		}
	}
});
Ext.define('Ext.ux.DEThemeBuilderStore',{
	extend:'Ext.data.Store',
	config:{
		autoSync:true,
		model:'Ext.ux.DEThemeBuilderRecord'
	} 
});
Ext.override(Ext.plugin.ListPaging, {
	loadNextPage: function() {
		if(this.storeFullyLoaded()){
			return;	
		}
        var store = this.getList().getStore();
        this.setLoading(true);
        this.scrollY = this.getScroller().position.y;
        store.nextPage({ addRecords: true });
    }	
});


Ext.define('Ext.ux.DEThemesStore',{
	extend:'Ext.data.Store',
	config:{
		pageSize:10,
		fields:['id', 'name', 'url', 'sdk', 'themeValues', 'builderName', 'baseColor', {name:'date', type:'date'}],
		proxy:{
			type:'jsonp',
			url:DEThemeBuilderUrl,
			extraParams:{task:'themes', bversion:DEThemeBuilderVersion, platform:DEPlatform},
			reader:{
				type:'json',
				rootProperty:'records',
				totalProperty:'totalCount'
			}
		}
	} 
});

Ext.define('Ext.ux.DEThemeBuilder', {
	extend:'Ext.Panel',
	xtype:'themebuilder',
	requires: [
        'Ext.Toolbar',
        'Ext.field.Text',
        'Ext.field.TextArea'
    ],
	config:{
		top: '4%',
		left: '4%',
		width:'92%',
		height:'80%',
		hideAction:'hide',
		layout:{type:'card', animation:{type:'slide', direction:'left'}},
		draggable:{direction:'both', disabled:true},
		modal:false,
		actionUrl:''		
	},
	constructor: function(config) {
		this.store = Ext.create('Ext.ux.DEThemeBuilderStore',{});
		try{
			this.store.load();
			var record  = this.store.last();
			if(!record){
				record = 	Ext.create('Ext.ux.DEThemeBuilderRecord', {
				   'base-gradient':'matte',
				   'basic-slider':0,
				   'include-highlights':1,
				   'include-default-icons':1
				});
				record.save();
				this.store.sync();
			}
			this.store.load();
		}catch(e){}
        config = config || {};

		config.items = this.getPanelItems();
        this.callParent([config]);
		this.form = this.child('formpanel');
		
    },
	getSdkName:function(){
		return DEGetSdkName();
	},
	initialize:function(){
		
		this.callParent();
		this.themeStore 				= Ext.create('Ext.ux.DEThemesStore',{});
		this.themeStore.getProxy().url 	= this.getActionUrl();
		this.themeStore.getProxy().getExtraParams().sdk = this.getSdkName();	
		this.themeStore.load();
		this.child('list').setStore(this.themeStore);
		this.on('painted', this.onPaint, this, {single:true});
		this.on('activeitemchange', this.showHideToolBarItems);
		var extraCss = '';
		if(DEPlatform=='ie10'){//bug in sencha css files
			extraCss = '.x-panel.x-floating .x-layout-card-item{background-color:#fff;}';
			extraCss += '.x-panel.x-floating .x-button-back:before,.x-panel.x-floating .x-button-forward:before,.x-form.x-floating .x-button-back:before, .x-form.x-floating .x-button-forward:before{color:#000;}'
			extraCss += '.x-panel.x-floating .x-button-back.x-button-pressing:before,.x-panel.x-floating .x-button-forward.x-button-pressing:before,.x-form.x-floating .x-button-back.x-button-pressing:before, .x-form.x-floating .x-button-forward.x-button-pressing:before{color:#FFF;}'
		}
		if(DEPlatform=='blackberry'){//bug in sencha css files
			extraCss = '.x-tabbar.x-docked-bottom{height:3em}';
		}
		var cssLoadingIndicator = Ext.DomHelper.append(
			Ext.getBody(),
			{
				tag:'style',
				html:extraCss+'.bottomToolbar{margin-top:1px !important;} .bottomToolbar .x-scroll-container, .bottomScroller{background-color:transparent !important;} .bottomScroller .x-scroll-container .x-inner{padding:0px !important;}.themeBuilderTitle .x-title{cursor:move}.poweredbyText{text-align:center;font-size:12px; padding:5px;}.loadMaskOuter{z-index: 100 !important;background-color: rgba(200,200,200,.8) !important;}.loadMaskOuter>.x-inner{background-color:transparent !important;}'
			}
		);
	},
	onPaint:function(){
		this.store.load();
		var last  = this.store.last();
		this.loadForm(last.getData());
		this.items.getAt(0).element.down('.x-innerhtml').setStyle('font-size', '80%');
	},
	showHideToolBarItems:function(panel, newActiveItem){
		var topToolBar = this.items.getAt(0);
		var topButtons = newActiveItem.config.topButtons?newActiveItem.config.topButtons:['back'];
		Ext.Array.each(topToolBar.query('button'), function(button, index){
			if(Ext.Array.contains(topButtons, button.config.name) ) {
				button.show();	
			}else{
				button.hide();	
			}					 
		});
	},
	getLoadMask:function(){
		if(!this.loadMaskPanel){			
			this.loadMaskPanel = Ext.Viewport.add({
				cls:'loadMaskOuter',
				masked:{
				   xtype:'loadmask',
				   message:'Theming...'
				}
			});
		}
		return this.loadMaskPanel;
	},
	loadMask:function(show){
		var mask = this.getLoadMask();
		if(show){
			mask.show();
		}else{
			mask.hide();
		}
	},
	renderTheme:function(record, content){
		this.loadMask(true);
		var dh 			= Ext.DomHelper, me=this;
		var oldCssFile 	= Ext.get('DE-theme-file');
		if(Ext.isString(record)){
			var url 		= record;
			if(content){
				var oldCssContent 	= Ext.get('DE-theme-content');
				if(!oldCssContent){
					var spec = {
						id:'DE-theme-content',
						tag:'style',
						type:'text/css',
						html:record
					};					
					dh.append(Ext.getBody(), spec);
				}
				Ext.get('DE-theme-content').setHtml(content);
				this.activeTheme = url.split('/').pop();
				if(oldCssFile){
					oldCssFile.set({'href':''})
				}
				this.loadMask(false);
				return;
			}
		}else{
			var url 		= record.get('url');
			var themeValues	= record.get('themeValues');
			if(themeValues){
				themeValues = Ext.decode(themeValues);
				this.loadForm(themeValues);
			}
		}
		this.activeTheme = url.split('/').pop();
		if(Ext.util.Cookies){
			Ext.util.Cookies.set('currentDESenchaTheme', url);	
		}
		
		var s = (new Date()).getTime();
		if(me.removeCssLoadingIndicatorTimeoutId){
			clearTimeout(me.removeCssLoadingIndicatorTimeoutId);
		}
		me.removeCssLoadingIndicatorTimeoutId = setTimeout(function(){
			me.alert('Error','Sorry, we are unable to load this theme. Try another one.');
			me.loadMask(false);										 
		}, 10000);
		
		var themeUrl = this.getActionUrl()+'?sdk='+this.getSdkName()+'&task=theme&file='+url+'?_t='+Math.random()+'&s='+s+'&bversion'+DEThemeBuilderVersion;
		if(!oldCssFile){
			var spec = {
				id:'DE-theme-file',
				tag:'link',
				rel:'stylesheet',
				type:'text/css',
				href:themeUrl
			};
			setTimeout(function(){
				dh.append(Ext.getBody(),spec);
			}, 10);
			var cssLoadingIndicatorConfig = {
				id:'DE-theme-file-loading',
				cls:'DE-theme-file-loading'+s,
				tag:'div'
			};
			var cssLoadingIndicator = dh.append(
				Ext.getBody(),
				cssLoadingIndicatorConfig
			);
			document.body.addEventListener('webkitAnimationEnd', function(event){
				if(event.target.id=='DE-theme-file-loading'){
					if(me.removeCssLoadingIndicatorTimeoutId){
						clearTimeout(me.removeCssLoadingIndicatorTimeoutId);
						me.loadMask(false);	
					}
				}
			}, false);
			//Ext.get(Ext.getBody()).addListener('webkitAnimationEnd', function(){alert('webkitAnimationEnd')});
		}else{
			var cssLoadingIndicator 		= Ext.get('DE-theme-file-loading').dom;
			cssLoadingIndicator.className 	= 'DE-theme-file-loading'+s
			setTimeout(function(){oldCssFile.set({'href':themeUrl});}, 10);
		}
	},
	getCurrentActiveTheme:function(){
		return this.activeTheme?this.activeTheme:false;
	},
	loadForm: function(values) {
		this.form.setValues(values);
        this.form.getFieldsAsArray().forEach(function(field) {
			field.originalValue=field.getValue();
        });
		this.form.lastValues = Ext.clone(values);
        return this;
    },
	alert:function(title, message, fn, scope){
		Ext.Msg.alert(title, message, fn, scope);
		Ext.Msg.items.getAt(0).items.getAt(0).innerHtmlElement.setStyle('overflow', 'visible');
	},
	getPanelItems:function(){
		var themeBuilder 		= this;
		var version 			= Ext.getVersion();
		var themeBuilderName 	= 'Sencha (Platform: '+DEPlatform+') '+version.getMajor()+'.'+version.getMinor()+'.* ThemeBuilder';
		var DEThemeLinkAlias	= 'sencha-theme-builder';
		return [{
			docked: 'top',
			xtype: 'titlebar',
			cls: 'themeBuilderTitle',
			title:'Theme Builder',
			items: [{
				text:'Themes',
				name:'themes',
				align:'left',
				handler:function(c, e){
					//themeBuilder.themeStore.load();
					themeBuilder.getLayout().setAnimation({type:'slide', direction:'left'});
					themeBuilder.setActiveItem(1);
				}
			},{
				text:'Back',
				align:'left',
				hidden:true,
				ui:'back',
				name:'back',
				handler:function(c, e){
					themeBuilder.getLayout().setAnimation({type:'slide', direction:'right'});
					themeBuilder.setActiveItem(0);
				}
			},{
				text:'Quick view',
				align:'right',
				name:'quickview',
				hidden:true,
				ui:'confirm',
				handler:function(){
					var sdk = DEGetSdkName().replace('sencha', '');
					var p = DEPlatform;					
					p = (p=='ie10')?'window-phone':p;
					
					window.open('http://developerextensions.com/index.php/sencha-theme-builder/themes/'+sdk+'/'+p);	
				}
			},{
				text:'Hide',
				align:'right',
				name:'close',
				handler:function(){
					this.up('panel').hide();	
				}
			}],
			listeners:{
				painted:function(){
					var panel = this.up('panel');
					this.element.down('.x-title').on({
						dragstart:function(e){
							panel.getDraggable().enable( ) ;
						},
						dragend:function(){
							panel.getDraggable().disable( );	
						},
						scope:this
					})
				}
			}
		},{
			xtype:'formpanel',
			scrollable:true,
			topButtons:['themes', 'close'],
			items:[{
				xtype:'toolbar',
				docked:'bottom',
				cls:'bottomToolbar',				
				scrollable: {
					direction: 'horizontal',
					indicators: false,					
					cls:'bottomScroller'					
				},				
				items:[{
					text:'Clear',
					scope:this,
					handler:function() {
						this.form.reset();
					}
				},{
					xtype:'spacer'
				},{
					text: 'Last values',
					scope: this,
					handler: function() {
						this.store.load();
						var last  = this.store.last();
						this.loadForm(last.getData());
					}		
				},{
					text: 'Test',
					ui: 'confirm',
					scope: this,
					handler: function() {
						var form 	= this.form;
						var last  	= this.store.last();
						
						form.updateRecord(last);
						last.save();
						this.store.sync();
						
						// Mask the form
						form.setMasked({
							xtype: 'loadmask',
							message: 'Saving...'
						});
						
						form.submit({
							url:this.getActionUrl(),
							params:{task:'build', sdk:this.getSdkName(), platform:DEPlatform, bversion:DEThemeBuilderVersion},
							scope:this,
							success:function(r, result){								
								if(!result.error){
									this.renderTheme(result.fileName, result.cssContents);
								}else{
									themeBuilder.alert('Error', result.error);
								}
							}
						});
					}
				},{
					text: 'Save',
					scope: this,
					handler: function() {
						var form 		= this.form;
						var lastValues 	= form.lastValues;
						var isDirty 	= false;
						var emptyFields = [], totalFields=0;
						Ext.Object.each(form.getValues(), function(name, newValue, subMitValues) {
							totalFields++;
							if(newValue==''){
								emptyFields.push(name);
							}
							if(!isDirty){
								isDirty = lastValues[name]!=newValue;
							}
						});
						if(isDirty){
							if(emptyFields.length==totalFields){
								themeBuilder.alert('InValid Form', 'You cann\'t save Empty form.');
							}else{
								themeBuilder.getLayout().setAnimation({type:'slide', direction:'left'});
								themeBuilder.setActiveItem(2);
							}
						}else{
							themeBuilder.alert('Old Values', 'Theme already exists for these values.');	
						}
					}
				}]
			},{
				xtype: 'fieldset',
				title: 'Colors',
				defaults: {
					required: true,
					labelAlign: 'left',
					labelWidth: '40%',
					xtype: 'textfield',
				},
				items: [{
					name:'base-color',
					label: 'Base Color'
				},{
					name: 'page-bg-color',
					label: 'Page bg color',
					hidden:(DEPlatform=='ie10' )
				},{
					name: 'form-bg-color',
					label: 'Form bg color',
					hidden:(DEPlatform!='sencha')
				},{
					name: 'active-color',
					label: 'Active color'
				},{
					name: 'confirm-color',
					label: 'Confirm Color',
					hidden:(DEPlatform!='sencha' && DEPlatform!='ie10')
				},{
					name: 'neutral-color',
					label: 'Neutral color',
					hidden:(DEPlatform!='sencha')
				},{
					name: 'alert-color',
					label: 'Alert color'
				},{
					name:'list-border-color',
					label:'Heading color',
					hidden:(DEPlatform!='blackberry' && DEPlatform!='ie10')
				},{
					name:'form-input-color',
					label:'Form input color',
					hidden:(DEPlatform!='blackberry' && DEPlatform!='ie10')
				}]
			},{
				xtype: 'fieldset',
				title: 'Settings',
				hidden:(DEPlatform!='sencha'),
				defaults: {
					required: true,
					labelAlign: 'left',
					labelWidth: '60%',
					xtype: 'togglefield',
				},
				items: [{
					name: 'basic-slider',
					label: 'Basic slider'
				},{
					name: 'include-highlights',
					label: 'Include highlights'
				},{
					name: 'include-default-icons',
					label: 'Include default icons'			
				}]
			},{
				name:'base-gradient',
				title:'Base Gradient',
				xtype:'fieldset',
				defaults:{ xtype: 'radiofield' },
				hidden:(DEPlatform=='ie10' ),
				items: [
					{ name: 'base-gradient', label: 'Matte', value: 'matte' },
					{ name: 'base-gradient', label: 'Bevel', value: 'bevel'},
					{ name: 'base-gradient', label: 'Glossy', value: 'glossy'},
					{ name: 'base-gradient', label: 'Recessed', value: 'recessed'},
					{ name: 'base-gradient', label: 'Flat', value: 'Flat'}
				]
			},{
				cls:'poweredbyText',
				html:themeBuilderName+' <a href="http://developerextensions.com/index.php/'+DEThemeLinkAlias+'" target="_blank">v'+DEThemeBuilderVersion+'</a> <br>Powered by <a href="http://developerextensions.com" target="_blank">http://developerextensions.com</a>',
			}]
		},{
			xtype:'list',
			topButtons:['back', 'quickview','close'],
			limit:10,
			itemTpl:'<div style="position:relative;"><div style="width:10px;height:10px;-webkit-border-radius: 4px;margin-right: 5px;display:inline-block;background-color:{baseColor}"></div>{name}, By:{builderName}<div class="x-list-disclosure" style="margin:0px;position: absolute;top: '+(DEPlatform=='sencha'?'-':'')+'0.4em !important;right: 0.44em;-webkit-transform:rotateZ(90deg);"></div></div>',
			plugins:[{xclass: 'Ext.plugin.ListPaging'},{xclass:'Ext.plugin.PullRefresh'}],
			listeners:{
				itemtap:function( container , index, target, record, e){
					if(e.target.className.indexOf('-disclosure')>0){
						 e.stopEvent();
						 window.location.href=themeBuilder.getActionUrl()+'?task=download&id='+record.get('id')+'&bversion'+DEThemeBuilderVersion;
					}else{
						themeBuilder.renderTheme(record);
					}
				}	
			}
		},{
			xtype:'formpanel',
			scrollable:true,
			topButtons:['back', 'close'],
			items:[{
				xtype:'toolbar',
				docked:'bottom',
				items:[{
					xtype:'spacer'
				},{
					text:'Save',
					ui:'confirm',
					scope:this,
					handler:function(me) {
						var theme = this.getCurrentActiveTheme();
						if(!theme){
							themeBuilder.alert('Sorry', 'Please create/choose theme.');
							return;
						}
						var themeValues = this.form.getValues();
						var form  = me.up('formpanel');
						form.setMasked({
							xtype: 'loadmask',
							message: 'Saving...'
						});
						form.submit({
							url:this.getActionUrl(),
							params:{task:'save', sdk:this.getSdkName(), theme:theme, themeValues:Ext.encode(themeValues), platform:DEPlatform, bversion:DEThemeBuilderVersion},
							scope:this,
							success:function(r, result){								
								if(!result.error){
									themeBuilder.alert('Success', 'Theme saved success fully');
								}else{
									themeBuilder.alert('Error', result.error);
								}
							}
						});
					}
				}]
			},{
				xtype:'fieldset',
				defaults:{
					required:true,
					labelAlign:'left',
					labelWidth:'40%',
					xtype:'textfield',
				},
				items: [{
					name:'name',
					label:'Theme Name'
				},{
					name:'builderName',
					label:'Builder',
					placeHolder:'Your name please'
				},{
					name:'builderEmail',
					label:'Email'
				}]
			}]
		}]
	}
});

function DEShowThemeBuilder(show){
	var  ua = navigator.userAgent;
	function isPhone(ua) {
		var isMobile = /Mobile(\/|\s)/.test(ua);

		// Either:
		// - iOS but not iPad
		// - Android 2
		// - Android with "Mobile" in the UA

		return /(iPhone|iPod)/.test(ua) ||
				  (!/(Silk)/.test(ua) && (/(Android)/.test(ua) && (/(Android 2)/.test(ua) || isMobile))) ||
				  (/(BlackBerry|BB)/.test(ua) && isMobile) ||
				  /(Windows Phone)/.test(ua);
	}

	function isTablet(ua) {
		return !isPhone(ua) && (/iPad/.test(ua) || /Android/.test(ua) || /(RIM Tablet OS)/.test(ua) ||
			(/MSIE 10/.test(ua) && /; Touch/.test(ua)));
	}
	
	
	if(!this.winThemeBuilder){
		var builderConfig = {xtype:'themebuilder', hidden:true, actionUrl:DEThemeBuilderUrl};
		if(!isPhone(ua) && !isTablet(ua)){//   platformConfig will not work for theme builder because we want to change platform (blackberry/ios/window phone)  on desktop
			builderConfig = Ext.apply(builderConfig, {
				top:1,
				left:1,
				height:400,
				width:450
			});
		}
		this.winThemeBuilder = Ext.Viewport.add(builderConfig);
	}
	if(show){
		this.winThemeBuilder.show();
	}else{
		this.winThemeBuilder.hide();
	}
}
