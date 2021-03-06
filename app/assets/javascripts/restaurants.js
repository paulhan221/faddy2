$(document).ready(function() {
  var address,
      geocoder,
      latitude,
      longitude;

  $('.search_button').on('click', function() {
    address = $("#address").val();
    geocoder = new google.maps.Geocoder();

    geocoder.geocode( { 'address': address}, function(results, status) {
      latitude = results[0].geometry.location.A;
      longitude = results[0].geometry.location.F;

      $('.address_form').on('ajax:before', function(event, xhr, settings) {
        console.log(latitude);
        console.log(longitude);
        var form = $(this);
        form.append($('<input />',{name: 'latitude', value: latitude, type: 'hidden' }));
        form.append($('<input />',{name: 'longitude', value: longitude, type: 'hidden' }));
      });

      $('.address_form').submit();
    });
  });

});
