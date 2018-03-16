//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require_tree .
function initMap(polygon) {
    var map;
    var bounds = new google.maps.LatLngBounds();
    var polygonStr = gon.dig_site_info;
    function initialize() {
        map = new google.maps.Map(
            document.getElementById("map"), {
                center: new google.maps.LatLng(-41.13390268058475, 32.07206917625161),
                zoom: 13,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
        drawPoly(polygonStr);
        map.fitBounds(bounds);

    }

    function drawPoly(multipolygonWKT) {
        var polylines = [];
        var toReturn = [];
        multipolygonWKT = multipolygonWKT.replace("POLYGON ", "");
        var formattedValues = multipolygonWKT.replace("))", "");
        formattedValues = formattedValues.replace("((", "");

        var linesCoords = formattedValues.split("), (");
        console.log(linesCoords);
        for (i = 0; i < linesCoords.length; i++) {
            polylines[i] = [];
            var singleLine = linesCoords[i].split(",");
            for (j = 0; j < singleLine.length; j++) {
                var coordinates = singleLine[j].split(" ");
                var latlng = new google.maps.LatLng(parseFloat(coordinates[0]), parseFloat(coordinates[1]));
                bounds.extend(latlng);
                polylines[i].push(latlng);
            }
        }
        toReturn.push(
            new google.maps.Polygon({
                map: map,
                paths: polylines,
                strokeColor: 'red',
                strokeOpacity: 1,
                strokeWeight: 2,
                zIndex: 1
            }));
        return toReturn;
    }

    google.maps.event.addDomListener(window, "load", initialize);
}
