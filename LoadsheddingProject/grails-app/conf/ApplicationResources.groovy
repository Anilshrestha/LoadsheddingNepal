modules = {
    application {
        resource url:'js/application.js'
    }

    "leaflet" {
        resource url:"js/leaflet.js",disposition: "head"
    }
    "jquery" {
        resource url:"js/jquery-1.8.2.min.js",disposition: "head"
    }

    "geoCoder" {
        resource url:"js/Control.Geocoder.js",disposition: "head"
    }

    "dataTable" {
        resource url:"js/jquery.dataTables.min.js",disposition: "head"
    }

    "bootstrap" {
        resource url:"js/bootstrap.min.js",disposition: "head"
    }

    "geoJsonData" {
        resource url:"js/data/states.js",disposition: "head"
    }
}