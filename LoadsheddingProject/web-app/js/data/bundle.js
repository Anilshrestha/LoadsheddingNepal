(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var pip = require('point-in-polygon');

function getLls(l) {
    var lls = l.getLatLngs(), o = [];
    for (var i = 0; i < lls.length; i++) o[i] = [lls[i].lng, lls[i].lat];
    return o;
}

var leafletPip = {
    bassackwards: false,
    pointInLayer: function(p, layer, first) {
        'use strict';
        if (p instanceof L.LatLng) p = [p.lng, p.lat];
        if (leafletPip.bassackwards) p.reverse();

        var results = [];
        layer.eachLayer(function(l) {
            if (first && results.length) return;
            // multipolygon
            var lls = [];
            if (l instanceof L.MultiPolygon) {
                l.eachLayer(function(sub) { lls.push(getLls(sub)); });
            } else if (l instanceof L.Polygon) {
                lls.push(getLls(l));
            }
            for (var i = 0; i < lls.length; i++) {
                if (pip(p, lls[i])) results.push(l);
            }
        });
        return results;
    }
};

module.exports = leafletPip;

},{"point-in-polygon":2}],2:[function(require,module,exports){
module.exports = function (point, vs) {
    // ray-casting algorithm based on
    // http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
    
    var x = point[0], y = point[1];
    
    var inside = false;
    for (var i = 0, j = vs.length - 1; i < vs.length; j = i++) {
        var xi = vs[i][0], yi = vs[i][1];
        var xj = vs[j][0], yj = vs[j][1];
        
        var intersect = ((yi > y) != (yj > y))
            && (x < (xj - xi) * (y - yi) / (yj - yi) + xi);
        if (intersect) inside = !inside;
    }
    
    return inside;
};

},{}],3:[function(require,module,exports){
var leafletPip = require('../'),
    map = L.map('map').setView([27.6863986, 85.3490229], 13),
    gjLayer = L.geoJson(statesData,{
	onEachFeature: onEachFeature
    });

L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png')
    .addTo(map);

gjLayer.addTo(map);
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
		fillColor:'Green'								,
	};

}

function callTable(name) {
	   var week=["Group","Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
$.getJSON("js/loadshedding_array.json" , function(data) {

    $.each(data, function() {
                $.each(this, function(k , v) {
		

		var table = document.getElementById("load_group");
		var row;
		if(name === v.group) {
			
				//console.log("morning: "+v.week[i].morning);
				row = table.insertRow(0);

				var cell1 = row.insertCell(0);
				var cell2 = row.insertCell(1);
				var cell3 = row.insertCell(2);
				var cell4 = row.insertCell(3);
				var cell5 = row.insertCell(4);
				var cell6 = row.insertCell(5);
				var cell7 = row.insertCell(6);
				var cell8 = row.insertCell(7);
				cell1.innerHTML = v.group;
				cell2.innerHTML = v.week[0].morning+"<br/>"+v.week[0].night;
				cell3.innerHTML = v.week[1].morning+"<br/>"+v.week[1].night;
				cell4.innerHTML = v.week[2].morning+"<br/>"+v.week[2].night;
				cell5.innerHTML = v.week[3].morning+"<br/>"+v.week[3].night;
				cell6.innerHTML = v.week[4].morning+"<br/>"+v.week[4].night;
				cell7.innerHTML = v.week[5].morning+"<br/>"+v.week[5].night;				
				cell8.innerHTML = v.week[6].morning+"<br/>"+v.week[6].night;
				table.appendChild(row);
			
		}//end if



            
        }) //end each       
        
    })//end each


});//end json
}

function onEachFeature(feature, layer) {

console.log("fe:"+layer);

	layer.on({
		mouseover: highlightFeature,
		mouseout: resetHighlight,
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
		fillOpacity: 0.5,
		//fillColor:'Green'
	});
console.log('layer name:'+layer.feature.properties.name);
callTable(layer.feature.properties.name);

	document.getElementById('load_group').style.visibility='visible';
	
	info.update(layer.feature.properties);
}


function resetHighlight(e) {
	gjLayer.resetStyle(e);
	document.getElementById('load_group').style.visibility='hidden';
deleteRow();
	//document.getElementById('2').style.visibility='hidden';
	//document.getElementById('1').style.visibility='hidden';	
	info.update();
}

function deleteRow() {
var rows = document.getElementById('load_group').getElementsByTagName("tr").length;
console.log("rows: "+rows);
if(rows>2) {
	for(var i=3;i<=rows;i++) {
		 document.getElementById("load_group").deleteRow(i-1);
	}
}else {
	document.getElementById("load_group").deleteRow(1);
}






}
var vo,va;
document.getElementById('location').onclick = function(){
console.log("inside here");
    var inp = document.getElementById("addr");

    $.getJSON('http://nominatim.openstreetmap.org/search?format=json&limit=5&q=' + inp.value, function(data) {
        var items = [];

        $.each(data, function(key, val) {
            bb = val.boundingbox;
		vo = bb;
va = val;
            items.push("<li><a href='#' id='test'>" + val.display_name + '</a></li>');
        });

		$('#results').empty();
        if (items.length != 0) {
            $('<p>', { html: "Search results:" }).appendTo('#results');
            $('<ul/>', {
                'class': 'my-new-list',
                html: items.join('')
            }).appendTo('#results');
        } else {
            $('<p>', { html: "No results found" }).appendTo('#results');
        }
    });
};

document.getElementById("test").onclick=function() {
var lat1 = vo[0];
var lng1 = vo[2];
var lat2 = vo[1];
var lng2 = vo[3];
var osm_type = va;
	var loc1 = new L.LatLng(lat1, lng1);
	var loc2 = new L.LatLng(lat2, lng2);
	var bounds = new L.LatLngBounds(loc1, loc2);

	if (feature) {
		map.removeLayer(feature);
	}
	if (osm_type == "node") {

		feature = L.circle( loc1, 25, {color: 'green', fill: false}).addTo(map);
		map.fitBounds(bounds);
		map.setZoom(18);
	} else {
		var loc3 = new L.LatLng(lat1, lng2);
		var loc4 = new L.LatLng(lat2, lng1);

		feature = L.polyline( [loc1, loc4, loc2, loc3, loc1], {color: 'red'}).addTo(map);
		map.fitBounds(bounds);
	}
}




document.getElementById('me').onclick = function() {
    navigator.geolocation.getCurrentPosition(function(pos) {
	enableHighAccuracy: true
        var res = leafletPip.pointInLayer(
            //["85.343","27.69348"], gjLayer);
		[pos.coords.longitude, pos.coords.latitude], gjLayer);
	console.log('point is: ' +res);
	console.log('longitude is: '+pos.coords.longitude);
		console.log('latitude is: '+pos.coords.latitude);
        if (res.length) {
            document.getElementById('me').innerHTML = res[0].feature.properties.name;
	    	//document.getElementById('load_group').style.visibility='visible';
		callTable(res[0].feature.properties.name);
		document.getElementById('load_group').style.visibility='visible';
        } else {
            document.getElementById('me').innerHTML = 'Sorry the location you are in is yet to be mapped!!';
        }
    });
};

},{"../":1}]},{},[3])
