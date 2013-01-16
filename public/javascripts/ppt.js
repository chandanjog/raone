// Single elements
$("#singleItem").addClass("active");
$("#container").addClass("active");

// Collections of elements
$("div").addClass("active");
$(".item").addClass("active");
$("input").addClass("active");


// Cross browser opacity:
// opacity: 0.9;  Chrome 4+, FF2+, Saf3.1+, Opera 9+, IE9, iOS 3.2+, Android 2.1+
// filter: alpha(opacity=90);  IE6-IE8

// Setting opacity
$(".container").css({ opacity:.5 });

// Getting opacity
var currentOpacity = $(".container").css('opacity');


// Equivalent to subscribe(topicName, callback)
$(document).on("topicName", function () {
    //..perform some behaviour
});

// Equivalent to publish(topicName)
$(document).trigger("topicName");

// Equivalent to unsubscribe(topicName)
$(document).off("topicName");


define(
    module_id /*optional*/,
    [dependencies] /*optional*/,
    definition
function /*function for instantiating the module or object*/
)
;


// A module_id (myModule) is used here for demonstration purposes only
define("myModule",

    ["foo", "bar"],

    // module definition function
    // dependencies (foo and bar) are mapped to function parameters
    function (foo, bar) {
        // return a value that defines the module export
        // (i.e the functionality we want to expose for consumption)

        // create your module here
        var myModule = {
            doStuff:function () {
                console.log("Yay! Stuff");
            }
        };

        return myModule;
    });

// An alternative version could be..
define("myModule",

    ["math", "graph"],

    function (math, graph) {

        // Note that this is a slightly different pattern
        // With AMD, it's possible to define modules in a few
        // different ways due to it's flexibility with
        // certain aspects of the syntax
        return {
            plot:function (x, y) {
                return graph.drawPie(math.randomGrid(x, y));
            }
        };
    });


// Consider "foo" and "bar" are two external modules
// In this example, the "exports" from the two modules
// loaded are passed as function arguments to the
// callback (foo and bar) so that they can similarly be accessed

require(["foo", "bar"], function (foo, bar) {
    // rest of your code here
    foo.doSomething();
});


define(function (require) {
    var isReady = false, foobar;

    // note the inline require within our module definition
    require(["foo", "bar"], function (foo, bar) {
        isReady = true;
        foobar = foo() + bar();
    });

    // we can still return a module
    return {
        isReady:isReady,
        foobar:foobar
    };
});
