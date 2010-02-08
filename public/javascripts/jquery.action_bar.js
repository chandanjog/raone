;
(

  function($){

    $.widget("cultural_district.action_bar", {
        _init: function(){
          var self=this, element=this.element, o=this.options;
          element.hide();
          self.refresh();
        },

        refresh: function(){
          var self=this, element=this.element, o=this.options;
          login_link = element.find("#login a");
          if (login_link.length > 0)
            self._trigger("_before_items_change", null, login_link);
          element.load(o.url, function(){
              self._assign_login_click_event();
              self._trigger("_login_link_loaded",null,(login_link.length > 1) ? login_link : element.find("#login a"));
            }
          );
        },

        show: function(){
          this.element.show();
        },

        _assign_login_click_event: function(){
          var self=this, element=this.element, o=this.options;

          element.find("#login a").click(function(event){
              event.preventDefault();
              self._trigger("_login_clicked",event,this);
            }
          );
        }
      }
    );

    $.extend($.cultural_district.action_bar, {
        defaults: {
          url: "/action_bar"
        }
      }
    );

  }

)(jQuery);

