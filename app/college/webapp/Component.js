sap.ui.define(
    ["sap/fe/core/AppComponent",
    "sap/ui/core/UIComponent",
    "sap/ui/Device",
    "college/model/models"],
    function (Component) {
        "use strict";

        return Component.extend("college.Component", {
            metadata: {
                manifest: "json"
            }
        });
    },

    function(UIComponent, Device, models) {
        "use strict";
      
        return UIComponent.extend("college.Component", {
          metadata: {
            manifest: "json"
          },
      
          init: function() {
            // call the base component's init function
            UIComponent.prototype.init.apply(this, arguments);
      
            // set the device model
            this.setModel(models.createDeviceModel(), "device");
      
            // create the views based on the url/hash
            this.getRouter().initialize();
          }
        });
      });
