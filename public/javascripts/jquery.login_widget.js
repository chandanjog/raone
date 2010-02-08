;
(
  function($){

    $.widget("cultural_district.login_widget",{

        _init: function(){
          var self=this,element=this.element,o=this.options;
          var parent_div = $("<div />");
          parent_div.css("login-widget-container")
          parent_div.load(o.login_form_path,function(){
              element.wzTooltip({content: parent_div,clickClose:false,width:500, offsetY:30});
              self._trigger("_loaded",null,element);
            }
          );
        },

        show:function(){
          var self=this,element=this.element,o=this.options;
          element.wzTooltip("show");
          self._attachFormActions();
        },

        hide:function(){
          var self=this,element=this.element,o=this.options;
          element.wzTooltip("hide");
          self._clearErrors();
        },

        _attachFormActions: function(){
          var self=this,element=this.element,o=this.options;
          $("#login-widget form").submit(function(){
              return false;
            }
          );
          $("#login-widget #login-button").click(function(){
              self._performLoginOperation();
            }
          );
        },

        _performLoginOperation: function(){
          var self=this,element=this.element,o=this.options;
          var email = element.find(".email").val();
          var password = element.find(".password").val();
          self._clearErrors();
          $.ajax({
            url: $("#login-widget form").attr("action"),
            dataType: "script",
            type: "POST",
            data:$("#login-widget form").serialize(),
            complete: function(xhr,status){
              $("#login-widget .progress").removeClass("ajax-loader");
              if (xhr.status === 406)
                self._displayErrors($.parseJSON(xhr.responseText));
              if (xhr.status === 202)
                self._trigger("_login_successful", null, element);
            }
          });
          $("#login-widget .progress").addClass("ajax-loader");
        },

        _clearErrors: function(){
          $("#login-widget .validation-msg").each(function(){
              $(this).empty();
            }
          );
          $("#login-widget .login-error").empty();
        },

        _displayErrors: function(json){
          var self=this,element=this.element,o=this.options;
          if (!(typeof(json["email"]) === "undefined"))
            $("#login-widget #email-validation").html(self._errorDiv(json["email"]));
          if (!(typeof(json["password"]) === "undefined"))
            $("#login-widget #password-validation").html(self._errorDiv(json["password"]));
          if (!(typeof(json["login_error"]) === "undefined"))
            $("#login-widget .login-error").html(self._errorDiv(json["login_error"]));
        },

        _errorDiv: function(error_message){
          errordiv = $("<div />");
          errordiv.html(error_message).css("login_widget_error");
          return errordiv;
        }
      }
    );

    $.extend($.cultural_district.login_widget,{
        defaults: {
          login_form_path: "/login"
        }
      }
    );

  }

)(jQuery);

