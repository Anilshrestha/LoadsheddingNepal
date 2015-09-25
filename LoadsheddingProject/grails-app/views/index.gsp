<%--
  Created by IntelliJ IDEA.
  User: saneel
  Date: 8/11/15
  Time: 8:39 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main">

    %{--need to be removed--}%
    %{--<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">--}%
    %{--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>--}%
    %{--<script src="http://localhost/js/data/jquery.min.js"></script>--}%
    %{--<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">--}%
    <link rel="stylesheet" href="">
    %{--<link rel="stylesheet" href="http://leafletjs.com/dist/leaflet.css">--}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'leaflet.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'Control.Geocoder.css')}">
    <script type="text/javascript" src="http://leafletjs.com/dist/leaflet.js"></script>
    <r:require module="jquery"/>
    %{--<r:require module="leaflet"/>--}%
    <r:require module="dataTable"/>
    <r:require module="geoCoder"/>
    <r:require module="geoJsonData"/>

    <script>
//    $(document).ready(function() {
//
//    } );
    </script>

    %{--<script type="text/javascript" src="http://localhost/js/jquery.dataTables.min.js"></script>--}%

    %{--<script type="text/javascript" src="js/leaflet.js"></script>--}%
    %{--<script type="text/javascript" src="http://localhost/js/data/bundle.js"></script>--}%
    %{--<script type="text/javascript" src="http://localhost/js/data/states.js"></script>--}%
    %{--<script type="text/javascript" src="http://localhost/js/Control.Geocoder.js"></script>--}%
    %{--<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>--}%
    %{--<script type="text/javascript" src="http://localhost/js/bootstrap.min.js"></script>--}%

    <style>
    td.highlight {
        background-color:green !important;
        opacity: 0.8;
    }

    .map_fix {
        width: 100%;
        height: 400px;
        /*margin-left: -326px;*/
        margin-top: 51px;
        margin-left:0px;
        border : 2px solid #000;
    }
    .map_fix1 {
        width: 896px;
        height: 400px;
        margin-left: 0px;
    }

    .table{
        margin-bottom: 0px !important;
    }
    .label {
        margin-right: 405px !important;
    }
    .dataTables_filter{
        margin-right: 0px;
    }
    .dataTables_scrollBody{
        height: 500px !important;

    }
    .map_fix2{
        width: 50px;
        height: 20px;
        margin-left: 900px;
        position: relative;

    }

    .wrapper {
        border : 2px solid #000;
        overflow:hidden;
    }

    .wrapper div {
        /*min-height: 200px;*/
        /*padding: 10px;*/
    }
    #one {
        background-color: #fff;
        float:left;
        margin-right:10px;
        width:350px;
        height:110px;
        /*border-right:2px solid #000;*/
    }
    #two {
        background-color: white;
        overflow:hidden;
        margin:10px;
        /*border:2px dashed #ccc;*/
        min-height:170px;
    }

    @media screen and (max-width: 400px) {
        #one {
            float: none;
            margin-right:0;
            width:auto;
            border:0;
            /*border-bottom:2px solid #000;*/
        }
    }

    .greenBtn {
        background: #1e8000;
        border: 1px solid #165f00;
        padding: 4px 15px 7px 15px;
        border-radius: 3px;
        color: #FFF;
        cursor: pointer;
        height: auto !important;
    }



    </style>
</head>

<body>
<div class="container">
    %{--<div class="row header" style="text-align:left;color:green;border:1px solid red;margin-top: 30px;">--}%
    %{--<h3>Load shedding table effective from</h3>--}%
    %{--</div>--}%

    %{--<p>Current load shedding hours: 16 hour.</p>--}%

    %{--<p>This area will have no loadshedding at the time of Teej and Shiva ratri.</p>--}%

    %{--</div>--}%
    %{--</div>--}%
    %{--<div class="clear"/>--}%
    %{--<div style="border: 1px solid red" class="map_fix"/>--}%
    %{--<div style="border: 1px solid green" class="map_fix1">--}%

    <div id="map" class="map_fix"></div>
    <div class="wrapper">
        <div id="one">
            <h6><i><b>Be a contributor, now you can submit the loadshedding group number of the location you know by registering.</b></i></h6>
            <form action="login/auth">
                <input type="submit" value="Get Started" class="greenBtn"/>
            </form>
            <br/>
            <br/>
            %{--<b><mark>${2} contributors</mark> have already contributed.</b>--}%
        </div>
        <div id="two">
            <tbody>
            <%String fileContents = new File("web-app/js/data/schedulechangedatae.txt").readLines().get(0)%>
            <h6><b>Load shedding schedule effective from:  <span style="color: red">${fileContents}</span></b></h6>
            <table id="myTable" class="table">
                <thead>
                <tr>
                    <th>Group\Week</th>
                    <th>Sunday</th>
                    <th>Monday</th>
                    <th>Tuesday</th>
                    <th>Wednesday</th>
                    <th>Thursday</th>
                    <th>Friday</th>
                    <th>Saturday</th>
                </tr>
                </thead>


               %{-- <tr>
                    <td>1 (One)</td>
                    <td>
                        09:00-13:00
                        17:00-21:00
                    </td>
                    <td>
                        11:00-15:00
                        20:00-23:00
                    </td>
                    <td>
                        10:00-14:00
                        18:00-22:00
                    </td>
                    <td>
                        08:00-11:00
                        17:00-20:00
                    </td>
                    <td>
                        07:00-10:00
                        15:00-18:00
                    </td>
                    <td>
                        06:00-09:00
                        14:00-17:00
                    </td>
                    <td>
                        06:00-08:00
                        13:00-17:00
                    </td>
                </tr>
                <tr>
                    <td>2 (Two)</td>
                    <td>
                        06:00-08:00
                        13:00-17:00
                    </td>
                    <td>
                        09:00-13:00
                        17:00-21:00
                    </td>
                    <td>
                        11:00-15:00
                        20:00-23:00
                    </td>
                    <td>
                        10:00-14:00
                        18:00-22:00
                    </td>
                    <td>
                        08:00-11:00
                        17:00-20:00
                    </td>
                    <td>
                        07:00-10:00
                        15:00-18:00
                    </td>
                    <td>
                        06:00-09:00
                        14:00-17:00
                    </td>
                </tr>
                <tr>
                    <td>3 (Three)</td>
                    <td>
                        06:00-09:00
                        14:00-17:00
                    </td>
                    <td>
                        06:00-08:00
                        13:00-17:00
                    </td>
                    <td>
                        09:00-13:00
                        17:00-21:00
                    </td>
                    <td>
                        11:00-15:00
                        20:00-23:00
                    </td>
                    <td>
                        10:00-14:00
                        18:00-22:00
                    </td>
                    <td>
                        08:00-11:00
                        17:00-20:00
                    </td>
                    <td>
                        07-10:00
                        15:00-18:00
                    </td>
                </tr>
                <tr>
                    <td>4 (Four)</td>
                    <td>
                        07:00-10:00
                        15:00-18:00
                    </td>
                    <td>
                        06:00-09:00
                        14:00-17:00
                    </td>
                    <td>
                        06:00-08:00
                        13:00-17:00
                    </td>
                    <td>
                        09:00-13:00
                        17:00-21:00
                    </td>
                    <td>
                        11:00-15:00
                        20:00-23:00
                    </td>
                    <td>
                        10:00-14:00
                        18:00-22:00
                    </td>
                    <td>
                        08:00-11:00
                        17:00-20:00
                    </td>
                </tr>
                <tr>
                    <td>5 (Five)</td>
                    <td>
                        08:00-11:00
                        17:00-20:00
                    </td>
                    <td>
                        07:00-10:00
                        15:00-18:00
                    </td>
                    <td>
                        06:00-09:00
                        14:00-17:00
                    </td>
                    <td>
                        06:00-08:00
                        13:00-17:00
                    </td>
                    <td>
                        09:00-13:00
                        17:00-21:00
                    </td>
                    <td>
                        11:00-15:00
                        20:00-23:00
                    </td>
                    <td>
                        10:00-14:00
                        18:00-22:00
                    </td>
                </tr>
                <tr>
                    <td>6 (Six)</td>
                    <td>
                        10:00-14:00
                        18:00-22:00
                    </td>
                    <td>
                        08:00-11:00
                        17:00-20:00
                    </td>
                    <td>
                        07:00-10:00
                        15:00-18:00
                    </td>
                    <td>
                        06:00-09:00
                        14:00-17:00
                    </td>
                    <td>
                        06:00-08:00
                        13:00-17:00
                    </td>
                    <td>
                        09:00-13:00
                        17:00-21:00
                    </td>
                    <td>
                        11:00-15:00
                        20:00-23:00
                    </td>
                </tr>

                <tr>
                    <td>7 (Seven)</td>
                    <td>
                        11:00-15:00
                        20:00-23:00
                    </td>
                    <td>
                        10:00-14:00
                        18:00-22:00
                    </td>
                    <td>
                        08:00-11:00
                        17:00-20:00
                    </td>
                    <td>
                        07-10:00
                        15:00-18:00
                    </td>
                    <td>
                        06:00-09:00
                        14:00-17:00
                    </td>
                    <td>
                        06:00-08:00
                        13:00-17:00
                    </td>
                    <td>
                        09:00-13:00
                        17:00-21:00
                    </td>
                </tr>--}%
                </tbody>
            </table>
        </div>
    </div>
    %{--<div class="row">--}%
    %{--<div class="span2">test</div>--}%
    %{--<div id="left" class="table-responsive" style="border: 1px solid purple">--}%
    %{--<table id="myTable" class="table" style="border: 1px solid green">--}%
    %{--<thead>--}%
    %{--<tr>--}%
    %{--<th>Group\Week</th>--}%
    %{--<th>Sunday</th>--}%
    %{--<th>Monday</th>--}%
    %{--<th>Tuesday</th>--}%
    %{--<th>Wednesday</th>--}%
    %{--<th>Thursday</th>--}%
    %{--<th>Friday</th>--}%
    %{--<th>Saturday</th>--}%
    %{--</tr>--}%
    %{--</thead>--}%
    %{--<tbody>--}%

    %{--<tr>--}%
    %{--<td>1 (One)</td>--}%
    %{--<td>--}%
    %{--09-13:00--}%
    %{--17:00-21:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--11-15:00--}%
    %{--20:00-23:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--10-14:00--}%
    %{--18:00-22:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--08-11:00--}%
    %{--17:00-20:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--07-10:00--}%
    %{--15:00-18:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--06-09:00--}%
    %{--14:00-17:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--06-08:00--}%
    %{--13:00-17:00--}%
    %{--</td>--}%
    %{--</tr>--}%
    %{--<tr>--}%
    %{--<td>2 (Two)</td>--}%
    %{--<td>--}%
    %{--06-08:00--}%
    %{--13:00-17:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--09-13:00--}%
    %{--17:00-21:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--11-15:00--}%
    %{--20:00-23:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--10-14:00--}%
    %{--18:00-22:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--08-11:00--}%
    %{--17:00-20:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--07-10:00--}%
    %{--15:00-18:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--06-09:00--}%
    %{--14:00-17:00--}%
    %{--</td>--}%
    %{--</tr>--}%
    %{--<tr>--}%
    %{--<td>3 (Three)</td>--}%
    %{--<td>--}%
    %{--06-09:00--}%
    %{--14:00-17:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--06-08:00--}%
    %{--13:00-17:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--09-13:00--}%
    %{--17:00-21:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--11-15:00--}%
    %{--20:00-23:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--10-14:00--}%
    %{--18:00-22:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--08-11:00--}%
    %{--17:00-20:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--07-10:00--}%
    %{--15:00-18:00--}%
    %{--</td>--}%
    %{--</tr>--}%
    %{--<tr>--}%
    %{--<td>4 (Four)</td>--}%
    %{--<td>--}%
    %{--07-10:00--}%
    %{--15:00-18:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--06-09:00--}%
    %{--14:00-17:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--06-08:00--}%
    %{--13:00-17:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--09-13:00--}%
    %{--17:00-21:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--11-15:00--}%
    %{--20:00-23:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--10-14:00--}%
    %{--18:00-22:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--08-11:00--}%
    %{--17:00-20:00--}%
    %{--</td>--}%
    %{--</tr>--}%
    %{--<tr>--}%
    %{--<td>5 (Five)</td>--}%
    %{--<td>--}%
    %{--08-11:00--}%
    %{--17:00-20:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--07-10:00--}%
    %{--15:00-18:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--06-09:00--}%
    %{--14:00-17:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--06-08:00--}%
    %{--13:00-17:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--09-13:00--}%
    %{--17:00-21:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--11-15:00--}%
    %{--20:00-23:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--10-14:00--}%
    %{--18:00-22:00--}%
    %{--</td>--}%
    %{--</tr>--}%
    %{--<tr>--}%
    %{--<td>6 (Six)</td>--}%
    %{--<td>--}%
    %{--10-14:00--}%
    %{--18:00-22:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--08-11:00--}%
    %{--17:00-20:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--07-10:00--}%
    %{--15:00-18:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--06-09:00--}%
    %{--14:00-17:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--06-08:00--}%
    %{--13:00-17:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--09-13:00--}%
    %{--17:00-21:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--11-15:00--}%
    %{--20:00-23:00--}%
    %{--</td>--}%
    %{--</tr>--}%

    %{--<tr>--}%
    %{--<td>7 (Seven)</td>--}%
    %{--<td>--}%
    %{--11-15:00--}%
    %{--20:00-23:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--10-14:00--}%
    %{--18:00-22:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--08-11:00--}%
    %{--17:00-20:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--07-10:00--}%
    %{--15:00-18:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--06-09:00--}%
    %{--14:00-17:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--06-08:00--}%
    %{--13:00-17:00--}%
    %{--</td>--}%
    %{--<td>--}%
    %{--09-13:00--}%
    %{--17:00-21:00--}%
    %{--</td>--}%
    %{--</tr>--}%
    %{--</tbody>--}%
    %{--</table>--}%



    %{--</div>--}%

    %{--</div>--}%



</div>
<script>


    var table=null;

    function getSchedule(){
        $.ajax({
            url: '${createLink(controller: 'index', action: 'loadsheddingSchedule')}',
            type: 'get',

            success: function (response) {

                var trHTML = '';
                $.each(response, function (i, item) {
                    trHTML += '<tr><td>' + item.groupWeek + '</td><td>' + item.sunday + '</td><td>' + item.monday + '</td><td>' + item.tuesday +  '</td><td>'+ item.wednesday +'</td><td>'+ item.thursday +'</td><td>'+ item.friday +'</td><td>'+ item.saturday + '</td></tr>';
                });
                $('#myTable').append(trHTML);


            }
        });

//        $.getJSON("http://10.0.2.2:8080/v1/service/1",
//                function(data) {
//                    var table = $('#display'), row = null, data = null;
//                    $.each(data, function(id, obj){
//                        row = $('<tr></tr>'); // build a row
//                        $.each(obj, function(colIndex, property) {
//                            data = $('<td></td>', { //build a td element
//                                text : property[colIndex] // assign the value from the iterated json property
//                            }).appendTo(row);
//                        });
//                    });
//                    row.appendTo(table); //finally append the row to the table
//                });
//    });
    }


    $(document).ready(function(){
        console.log('here');
        //in order to get the day of the week as per the current date
        var date = new Date();
        var day = date.getDay();




        //calling dataTable
        table = $('#myTable').DataTable({
            "sScrollX": ($(window).height() - 800),//defining the width
            "sScrollY": ($(window).height() - 850),//defining the height
            "bPaginate": false,//hide pagination
            "bJQueryUI": true,//use jquery UI in data table theme
            "ajax": '${resource(dir: 'js/data', file: 'data.txt')}'



        });


        //highlighting the particular column as per the current day.If sunday ,column sunday of load shedding table will be highlighted.
        var colIdx = day+1;//As day 0 is sunday

        $( table.column( colIdx) ).addClass( 'highlight' );





    });



    $(window).resize(function() {
        $('.dataTables_scrollBody').css('height', ($(window).height() - 200));
    });

    //loading map with the latitude and longitude in the setview and zoom level 13.
    var map = L.map('map').setView([27.6863986, 85.3490229], 13);
    //loading geojson data
    var gjLayer = L.geoJson(statesData,{
        onEachFeature: onEachFeature//calling onEachFeature provided by leaflet
    });

    //loading tiles provided by mapbox
    var tile_layer = L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6IjZjNmRjNzk3ZmE2MTcwOTEwMGY0MzU3YjUzOWFmNWZhIn0.Y8bhBaUMqFiPrDRW9hieoQ', {
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


    //load geojson data after all the tiles are loaded
    tile_layer.on("load",function() {
        console.log("all visible tiles have been loaded")
        gjLayer.addTo(map);
    });

    gjLayer.setStyle(style());
    gjLayer.on("click", function (e) {
        var popupContent=e.layer.feature.properties.name;
        e.layer.bindPopup(popupContent);
        e.layer.openPopup();
    }).addTo(map);

    var info = L.control();
    info.onAdd = function(map) {
        this._div = L.DomUtil.create('div','info');
        this._div.setAttribute("style","padding: 6px 8px; font:14px/16px Arial; background:white; background: rgba(255,255,255,0.8); box-shadow:0 0 15px rgba(0,0,0,0.2);border-radius:5px;");
        this.update();
        return this._div;
    };

    info.update = function (props) {
        this._div.innerHTML = (props ? '<b>' + props.name + '</b>':'Hover over');
    };



    info.addTo(map);

    function style(feature) {


        return {
            weight:2,
            opacity:0.5,
            color:'#369EE3',
            dashArray: '3',
            fillOpacity: 0.5,
            fillColor:'Green'
        };

    }


    //    L.marker([51.5, -0.09]).addTo(map)
    //            .bindPopup("<b>Hello world!</b><br />I am a popup.").openPopup();
    //
    //    L.circle([51.508, -0.11], 500, {
    //        color: 'red',
    //        fillColor: '#f03',
    //        fillOpacity: 0.5
    //    }).addTo(map).bindPopup("I am a circle.");
    //
    //    L.polygon([
    //        [51.509, -0.08],
    //        [51.503, -0.06],
    //        [51.51, -0.047]
    //    ]).addTo(map).bindPopup("I am a polygon.");
    //

    var popup = L.popup();

    //    function onMapClick(e) {
    //        popup
    //                .setLatLng(e.latlng)
    //                .setContent("You clicked the map at " + e.latlng.toString())
    //                .openOn(map);
    //    }

    function onEachFeature(feature, layer) {

        console.log("fe:"+layer);

        layer.on({
            mouseover: highlightFeature,
            mouseout: resetHighlight
        });
    }


    function highlightFeature(e) {
        var layer = e.target;
        layer.setStyle({
            //weight:3,
            //dashArray:'',
            //fillOpacity:0.1
            weight:2,
            //opacity:0.5,
            //color:'#369EE3',
            dashArray: '3',
            fillOpacity: 0.5
            //fillColor:'Green'
        });
//        getSchedule();
        console.log('layer name:'+layer.feature.properties.name);
        table.search(layer.feature.properties.name).draw();

        //callTable(layer.feature.properties.name);

        //document.getElementById('load_group').style.visibility='visible';

        info.update(layer.feature.properties);
    }


    function resetHighlight(e) {
        gjLayer.resetStyle(e);

        //inorder to reinitialise the table, the table created must be destroyed.
        table.destroy();

        //reinitialising the datatable
        table = $('#myTable').DataTable({
            "sScrollX": ($(window).height() - 200),//defining the width
            "sScrollY": ($(window).height() - 350),//defining the height
            "bPaginate": false,//hide pagination
            "bJQueryUI": true//use jquery UI in data table theme

        });

        info.update();
    }

    //    map.on('click', onMapClick);

</script>/
</body>
</html>