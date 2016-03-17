//= require ./jquery-1.12.1.min
//= require ./d3.min
//= require ./c3.min
//= require ./materialize
//= require ./owl.carousel.min
//= require ./jquery.tablesorter


$(document).ready(function(){

  $('.dropdown-button').dropdown({
    hover: false, // Activate on hover
    gutter: 0, // Spacing from edge
    belowOrigin: false, // Displays dropdown below the button
    alignment: 'right' // Displays dropdown with edge aligned to the left of button
  });    

  $('.button-collapse-right').sideNav({
    menuWidth: 300, // Default is 240
    edge: 'right', // Choose the horizontal origin
    closeOnClick: false // Closes side-nav on <a> clicks, useful for Angular/Meteor
  }); 

  $('.button-collapse-left').sideNav({
    menuWidth: 240, // Default is 240
    edge: 'left', // Choose the horizontal origin
    closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
  }); 

  $(".owl-carousel").owlCarousel({
    // Features
    items : 5, // 5 items above 1000px browser width
    itemsDesktop : [1920,4], // 4 items between 1199px and 980px
    itemsDesktopSmall : [1366,3], // 3 betweem 979px and 769px
    itemsTablet: [768,2], // 2 items between 768 and 479
    itemsMobile : [479,1], // 1 betweem 479px and 1px
    // Set AutoPlay
    autoPlay: false, 
    // Navigation
    navigation : true,
    navigationText : ["prev","next"],
    // Responsive 
    responsive: true,
    responsiveRefreshRate : 200,
  });

  $("#myTable").tablesorter({
    // sort on the first column and third column, order asc 
    sortList: [[0,0]],
    headers: { 
      4: { 
        // disable it by setting the property sorter to false 
        sorter: false 
      } 
    } 
  });

  $('.modal-trigger').leanModal();
});


