<html>
<head>
<meta http-equiv="refresh">
<title>Nepal Loadshedding Map</title>
<meta name="layout" content="admin_dashboard">
<link rel="stylesheet" href="${resource(dir: "css", file: "leaflet.css")}"/>
%{--<link rel="stylesheet" href="${resource(dir: "css", file: "leaflet.contextmenu.css")}"/>--}%
%{--<link rel="stylesheet" href="${resource(dir: "css",file:"style.css")}" />--}%
%{--<link rel="stylesheet" href="${resource(dir: "css", file: "leaflet.modal.css")}"/>--}%
%{--<link rel="stylesheet" href="${resource(dir: "css", file: "leaflet.bookmarks.css")}"/>--}%
<link rel="stylesheet" href="${resource(dir: 'css', file: 'Control.Geocoder.css')}">

<script type="text/javascript" src="http://leafletjs.com/dist/leaflet.js"></script>
<style>
/*html, body {*/
/*margin: 0;*/
/*padding: 0;*/
/*}*/

.export {
    background:none !important;
    /*#ccc url("../images/skin/shadow.jpg") repeat-x scroll center bottom;*/
    border: 0px solid #CCC !important;
    margin: 5px 11px !important;
    padding: 12px 3px 11px 19px !important;
    width: 100% !important;
}

#map {
    margin-top: 50px;
    width: 100%;
    height: 92%;
    display: block;
}

a:focus{
    outline: 0;
}

/*.leaflet-control-zoom-in {*/
/*width: 40px !important;*/
/*}*/

/*.leaflet-control-zoom-out {*/
/*width: 40px !important;*/
/*}*/

/*.leaflet-top .leaflet-control {*/
/*margin-top: 40px !important;*/
/*width: 40px !important;*/
/*height: 40px !important;*/
/*}*/
</style>
%{--<r:require module="bundle"/>--}%

<r:require module="jquery"/>
<r:require module="geoCoder"/>
<r:require module="pnotify"/>
%{--<r:require module="leaflet"/>--}%

<g:javascript>
        function getUserId() {
                    var userId = ${session["currentUserId"]};
                    console.log("uid: "+userId);
                    return userId;
        }

        var map = L.map('map').setView([27.6863986, 85.3490229], 15);

		var tile_layer = L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
        maxZoom: 18,
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' +
                '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
                'Imagery © <a href="http://mapbox.com">Mapbox</a>',
        id: 'mapbox.streets'
    }).addTo(map);

    //adding the geocoder plugin in order to search the different places
    geocoder = L.Control.Geocoder.nominatim(),
            control = L.Control.geocoder({
                geocoder: geocoder
            }).addTo(map);

%{-- var data = null;
 console.log("d: "+data);
 if(data == null) {
     L.marker([51.5, -0.09]).addTo(map)
     .bindPopup("<input id='getval' type='text'/>").openPopup();
 }else {

 }

--}%

    $( document ).ready(function() {
        console.log( "ready!" );
    <g:each in="${res}" var="i">
        L.marker([${i.latitude},${i.longitude}]).addTo(map).bindPopup("${i.groupName}").openPopup();
    </g:each>

    });
    L.circle([51.508, -0.11], 500, {
        color: 'red',
        fillColor: '#f03',
        fillOpacity: 0.5
    }).addTo(map).bindPopup("I am a circle.");

    L.polygon([
        [51.509, -0.08],
        [51.503, -0.06],
        [51.51, -0.047]
    ]).addTo(map).bindPopup("I am a polygon.");


    var popup = L.popup();




//working
%{--var marker = L.marker([51.51, -0.047]);
marker.bindPopup("Loading...")
marker.on('click', function(e) {
var popup = e.target.getPopup();
var url="${createLink(controller: 'index', action: 'test')}";
$.get(url).done(function(data) {
    popup.setContent(data);
    popup.update();
});
});

marker.addTo(map);
--}%//complete


		var latitude = null;
		var longitude = null;
		function checkSelectedOption(lat,lng) {
		        //selected value from the select option
                var selectedValue = $("#type").val();

                //combining selected option, latitude and longitude
                var parameter = selectedValue+";"+lat+";"+lng;

                //submiting parameter to controller
                ajaxSubmit(parameter);

		}

		function onMapClick(e) {
        latitude = e.latlng.lat;
        longitude = e.latlng.lng;
		    L.marker([e.latlng.lat,e.latlng.lng],{clickable:false}).addTo(map)
			            .bindPopup('<select id="type" onchange="checkSelectedOption(latitude, longitude)">' +
'<option value="select group">Select group</option>' +
'<option value="Group 1">Group 1</option>' +
'<option value="Group 2">Group 2</option>' +
'<option value="Group 3">Group 3</option>' +
'<option value="Group 4">Group 4</option>' +
'<option value="Group 5">Group 5</option>' +
'<option value="Group 6">Group 6</option>' +
'<option value="Group 7">Group 7</option>' +
'</select>'

                        ).openPopup();

		}

%{--function markerClick() {--}%
%{--var marker = L.marker([e.latlng.lat,e.latlng.lng]);--}%
%{--marker.bindPopup("Loading...")--}%
%{--marker.on('click', function(e) {--}%
%{--var popup = e.target.getPopup();--}%
%{--var url="${createLink(controller: 'index', action: 'getMarkerContent')}";--}%
%{--$.get(url).done(function(data) {--}%
%{--popup.setContent(data);--}%
%{--popup.update();--}%
%{--});--}%

%{--$.ajax({--}%
%{--url:"${createLink(controller: 'index', action: 'getMarkerContent')}",--}%
%{--type:'get',--}%
%{--data: {--}%
%{--latitude:e.latlng.lat,--}%
%{--longitude:e.latlng.lng--}%
%{--},--}%
%{--success : function (resp){--}%
%{--if(resp=="noValue") {--}%
%{--console.log('No results found');--}%
%{--}else {--}%
%{--popup.setContent(data);--}%
%{--popup.update();--}%
%{--}--}%
%{--}--}%

%{--});--}%
%{--});--}%
%{--}--}%

    map.on('click', onMapClick);




    function ajaxSubmit(data) {
    $.ajax({
            url:"${createLink(controller: 'index', action: 'insertUserSubmittedData')}",
                type:'post',
                data: {
                       inputdata :data
                      },
                success : function (resp){
                if(resp=="success") {
                    alert("Data inserted successfully")
                    window.location.reload();
                }
            }
            });

        }

</g:javascript>

</head>

<body>
<div body="container">
    <div id="map"></div>
</div>

<r:layoutResources/>
</body>
</html>