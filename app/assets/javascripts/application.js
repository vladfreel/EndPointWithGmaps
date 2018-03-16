// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require_tree .

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 5,
        center: {lat: -81.13390268058475, lng: 32.07206917625161},
        mapTypeId: 'terrain'
    });

    // Define the LatLng coordinates for the polygon's path.
    var triangleCoords = [
        {lat: -81.13390268058475, lng:32.07206917625161},
        {lat: -81.14660562247929, lng:32.04064386441295},
        {lat: -81.08858407706913, lng:32.02259853170128},
        {lat: -81.05322183341679, lng:32.02434500961698},
        {lat: -81.05047525138554, lng:32.042681017283066},
        {lat: -81.0319358226746, lng:32.06537765335268},
        {lat: -81.01202310294804, lng:32.078469305179404},
        {lat: -81.02850259513554, lng:32.07963291684719},
        {lat: -81.07759774894413, lng:32.07090546831167},
        {lat: -81.12154306144413, lng:32.08806865844325},
        {lat: -81.13390268058475, lng:32.07206917625161}
    ];

    // Construct the polygon.
    var bermudaTriangle = new google.maps.Polygon({
        paths: triangleCoords,
        strokeColor: '#FF0000',
        strokeOpacity: 0.8,
        strokeWeight: 2,
        fillColor: '#FF0000',
        fillOpacity: 0.35
    });
    bermudaTriangle.setMap(map);
}

