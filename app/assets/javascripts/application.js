// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require users
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

core = {};

$(document).ready(function() {
  core.readyFormGenderMale();
  core.readyFormGenderFemale();
});

/* ----- Init methods ----- */

// Attach events for referee form
// core.readyFormGenderMale = function() {
//   $('.male').on('click', function(e) {
//     e.preventDefault();
//     // $("#male-radio").attr("checked", true)
//     jQuery("#radio_1").attr('checked', 'checked');
//     e.preventDefault();
//   });
// }

// core.readyFormGenderFemale = function() {
//   $('.female').on('click', function(e) {
//     e.preventDefault();
//     alert('hello!')
//     $("#female").prop("checked", true)
//   });
// }