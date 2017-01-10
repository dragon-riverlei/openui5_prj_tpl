jQuery.sap.declare("${RESOURCE_ROOT}.Component");
jQuery.sap.require("${RESOURCE_ROOT}.Router");

sap.ui.core.UIComponent.extend("${RESOURCE_ROOT}.Component", {
	metadata: {
		name: "${COMPONENT_NAME}",
		version: "${COMPONENT_VERSION}",
		includes: [],
		dependencies: {
			libs: [
				"sap.m", "sap.ui.layout"
			],
			components: []
		},
		rootView: "${RESOURCE_ROOT}.view.${ROOT_VIEW}",
		routing: {
			config: {
				routerClass: ${RESOURCE_ROOT}.Router,
				viewType: "XML",
				viewPath: "${RESOURCE_ROOT}.view",
				clearTarget: false
			},
			routes: [
			]
		}
	},

	init: function() {
		sap.ui.core.UIComponent.prototype.init.apply(this, arguments);
		this.getRouter().initialize();
	}

});
