var fbSdkLoader = function() {
    if(!Session.get("is Facebook JDK loaded?")) { // Load Facebook JDK only once.
      Session.set("is Facebook JDK loaded?", true);
      window.fbAsyncInit = function() { // See Facebook JavaScript JDK docs at: https://developers.facebook.com/docs/reference/javascript/
        // Init the FB JS SDK
        var initConfig = {
          appId: '610153542362253', // App ID from the App Dashboard
          // channelUrl: Meteor.absoluteUrl("channel.html"), // channel url for FB
          status: false, // check the login status upon init?
          cookie: false, // set sessions cookies to allow your server to access the session?
          xfbml: false // parse XFBML tags on this page?
        };
        FB.init(initConfig);
      };
 
      (function(d, debug) { // Load the SDK's source Asynchronously
        var js, id = 'facebook-jssdk',
          ref = d.getElementsByTagName('script')[0];
        if(d.getElementById(id)) {
          return;
        }
        js = d.createElement('script');
        js.id = id;
        js.async = true;
        js.src = "//connect.facebook.net/en_US/all" + (debug ? "/debug" : "") + ".js";
        ref.parentNode.insertBefore(js, ref);
      }(document, /*debug*/ false));
    }
  };
fbSdkLoader(); // run the loader