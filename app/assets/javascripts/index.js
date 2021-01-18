document.addEventListener("turbolinks:load", function() {

// Index page //
  // Click function on teacher button, takes user to teacher login //
  $("#studentBtn").click(function() {
    window.location = "/pages/slogin"
  });

   // Click function on teacher button, takes user to teacher login //
   $("#teacherBtn").click(function() {
     window.location = "/pages/tlogin"
   });

// Login pages

   // Click function on student button, checks login and takes to student landing page //
   $("#slogin").click(function() {
     window.location = "/pages/slanding"
   });

   // Click function on teacher button, checks login and takes to teacher landing page //
   $("#tlogin").click(function() {
     window.location = "/pages/tlanding"
   });

// Tlanding page //

    // Click function on points button, takes user to give or take points //
    $("#points").click(function() {
      window.location = "/pages/points"
    });

   // Click function on mait button, takes user to mait page //
   $("#maintenance").click(function() {
     window.location = "/pages/maintenance"
   });

  // Makes buttons on mait page take user to correct location //
  $("#epoints").click(function() {
    window.location = "/pages/epoints"
  });

  $("#estudents").click(function() {
    window.location = "/pages/estudents"
  });

  $("#estore").click(function() {
    window.location = "/pages/estore"
  });

  $("#messageStudents").click(function() {
    window.location = "/pages/tmessages"
  });

  $("#alerts").click(function() {
    window.location = "/pages/alerts"
  });

  $("#profile").click(function() {
    window.location = "/pages/profile"
  });

  $("#support").click(function() {
    window.location = "/pages/support"
  });

// Slanding page //

  // Makes buttons on student landing page take user to correct location //

  $("#spoints").click(function() {
    window.location = "/pages/spoints"
  });

  $("#store").click(function() {
    window.location = "/pages/store"
  });

  $("#smessages").click(function() {
    window.location = "/pages/smessages"
  });

// Edit student page //

  // Shows modal for adding new student //
  $("#newStudent, .studentPoints").click(function() {
    $('#studentModal').show();
  });

  // Shows modal for updating existing students //
  $("#updateStudent").click(function() {
    $('#updateModal').show();
  });

  // Closes student addition modal when close button is clicked //
  $(".close").click(function() {
    $('#studentModal, #updateModal, #productModal').hide();
  });

// Edit store page //

  // Shows modal for adding new product //
  $("#newProduct").click(function() {
    $('#productModal').show();
  });

// Points page //

  // Sound information //
  let giveSound = new Audio('http://abbeytipton.info/right_sound.wav');
  let takeSound = new Audio('http://abbeytipton.info/projects/wrong_sound.mp3');

  $('.give').click(function() {
     giveSound.play();
   });

   $('.take, .takeBig').click(function() {
      takeSound.play();
    });

});
