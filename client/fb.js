window.fbAsyncInit = function() {
    // init the FB JS SDK
    FB.init({
      appId      : '610153542362253',                        // App ID from the app dashboard
      // channelUrl : '//http://ipmd.local/channel.html', // Channel file for x-domain comms
      status     : true,                                 // Check Facebook Login status
      xfbml      : true                                  // Look for social plugins on the page
    });
 
     FB.login(function(response) {
       if (response.authResponse) {
         console.log('Welcome!  Fetching your information.... ');
         FB.api('/me', function(response) {
           console.log('Good to see you, ' + response.email + '.', response);
         });
         FB.api('/me/friends', function(response) {
            console.log(response);
            window.friends = response;
            var divContainer=$('#facebook-friends');
             for(i=0;i<response.data.length;i++)
                 {
                     $(document.createElement("img")).attr({ src: 'https://graph.facebook.com/'+response.data[i].id+'/picture', title: response.data[i].name ,onClick:'alert("You poked "+this.title);'})
                     .appendTo(divContainer);
                 }
        });
     //     FB.logout(function(response) {
      //   console.log('LOGOUT')
      // });
       } else {
         console.log('User cancelled login or did not fully authorize.');
       }
     }, {scope: 'email'});
 
    // Additional initialization code such as adding Event Listeners goes here
  };
 
  // Load the SDK asynchronously
  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/all.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));