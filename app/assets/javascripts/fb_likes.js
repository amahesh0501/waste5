(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=265059916990245";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

$(document).ready(function(){
   // Target your .container, .wrapper, .post, etc.
   var text = $("#u_0_2").text();
   debugger
   console.log(text)
 });