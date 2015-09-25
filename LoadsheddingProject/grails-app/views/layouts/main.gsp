<html>
%{--<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->--}%
%{--<!--[if IE 7 ]>    <!--<html lang="en" class="no-js ie7"-->> <![endif]-->--}%
%{--<!--[if IE 8 ]>    <!--<html lang="en" class="no-js ie8"-->> <![endif]-->--}%
%{--<!--[if IE 9 ]>    <!--<html lang="en" class="no-js ie9"-->> <![endif]-->--}%
%{--<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->--}%
	<head>
		%{--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--}%
		%{--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--}%
		<title><g:layoutTitle default="Nepal Loadshedding Map"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
         %{--<r:require module="jquery"/>--}%
        %{--<r:require module="bootstrap"/>--}%
         %{--<r:require module="leaflet"/>--}%
         %{--<r:require module="geoCoder"/>--}%

		%{--<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">--}%
		%{--<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">--}%
		%{--<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">--}%
		%{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">--}%
		%{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">--}%

            <!-- Bootstrap core CSS -->
        <link href="${resource(dir: "css",file: "bootstrap.min.css")}" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="${resource(dir: "css",file: "sticky-footer.css")}" rel="stylesheet">

        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><!--<script src="../../assets/js/ie8-responsive-file-warning.js"></script>--><![endif]-->
        %{--<script src="http://getbootstrap.com/assets/js/ie-emulation-modes-warning.js"></script>--}%

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <!--<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>-->
          %{--<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>--}%
        %{--<![endif]-->--}%

        %{--i added--}%
    %{--<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://localhost/js/data/jquery.min.js"></script>
    --}%%{--<link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">--}%%{--
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.dataTables.min.css')}">
    --}%%{--<link rel="stylesheet" href="http://leafletjs.com/dist/leaflet.css">--}%%{--
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'leaflet.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'Control.Geocoder.css')}">
    <script type="text/javascript" src="http://localhost/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="http://leafletjs.com/dist/leaflet.js"></script>
    --}%%{--<script type="text/javascript" src="js/leaflet.js"></script>--}%%{--
    <script type="text/javascript" src="http://localhost/js/data/bundle.js"></script>
    <script type="text/javascript" src="http://localhost/js/data/states.js"></script>
    <script type="text/javascript" src="http://localhost/js/Control.Geocoder.js"></script>
    --}%%{--<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>--}%%{--
    <script type="text/javascript" src="http://localhost/js/bootstrap.min.js"></script>--}%
		<g:layoutHead/>
		<r:layoutResources />
    <style>
    .container {
        width: auto;
        padding: 0 15px;
    }
    a:focus{
        outline: 0;
    }
    </style>
	</head>
	<body>
		%{--<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>--}%
        <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <g:link class="navbar-brand" controller="index">Nepal Loadshedding Map</g:link>
            </div>
            <div id="navbar" class="collapse navbar-collapse pull-right">
                <ul class="nav navbar-nav">
                    %{--<li><g:link controller="index/about">About</g:link></li>--}%
                    %{--<li><g:link class="navbar-brand" controller="index/user">Contact</g:link></li>--}%
                    <li><g:link controller="login/auth">Login</g:link></li>
                    %{--<sec:ifLoggedIn>--}%
                        %{--<li><g:link controller="logout">Sign out</g:link></li>--}%

                    %{--</sec:ifLoggedIn>--}%
                    %{--<li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li>
                            <li role="separator" class="divider"></li>
                            <li class="dropdown-header">Nav header</li>
                            <li><a href="#">Separated link</a></li>
                            <li><a href="#">One more separated link</a></li>
                        </ul>
                    </li>--}%
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
		<g:layoutBody/>

    <footer class="footer">
        <div class="container">
            <%def date = new Date()%>
            <p class="text-muted text-center">&copy; <g:formatDate date="${date}" format="yyyy" /> Nepal Loadshedding Map</p>
        </div>
    </footer>
		%{--<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>--}%
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
