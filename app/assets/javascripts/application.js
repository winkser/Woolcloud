// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require hermitage
//= require jquery_ujs
//= require turbolinks
//= require_tree .

(function() {
  //function for load code after body html!
document.addEventListener("DOMContentLoaded", function(event) { 

document.onkeyup = function (e) {
    e = e || window.event;
    if (e.keyCode === 13) {
      document.getElementById('send_message').click();
    }
}

document.getElementById('send_message').onclick = function() {

    var message = {
    text: document.getElementById('text').value,
    send_to: document.getElementById('send_to').innerHTML
 };
    App.messages.action_on_client(message);
    document.getElementById('text').value = "";
 };

});

}).call(this);

