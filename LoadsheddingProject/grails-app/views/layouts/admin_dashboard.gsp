<%--
  Created by IntelliJ IDEA.
  User: saneel
  Date: 8/12/15
  Time: 4:18 PM
--%>

<html>
<head>
    <title><g:layoutTitle default="Nepal Loadshedding Map"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap core CSS -->
    <link href="${resource(dir: "css",file: "bootstrap.min.css")}" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${resource(dir: "css",file: "sticky-footer.css")}" rel="stylesheet">
    <export:resource/>

    <g:layoutHead/>
    %{--<r:layoutResources/>--}%
    <style>
    .container {
        width: auto;
        /*max-width: 680px;*/
        padding: 0 15px;
    }
    </style>
</head>
<body>
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

                <sec:ifLoggedIn>
                    <li><export:formats formats="['excel']" action="exportToExcel" params="" title="Export to Excel"/></li>
                    <li class="text-muted" style="margin-right: -95px;margin-top: 0px;">Welcome ${session["userName"]}</li>
                    <li><g:link controller="logout">Sign out</g:link></li>
                </sec:ifLoggedIn>

            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<g:layoutBody/>

<footer class="footer">
    <div class="container">
        <p class="text-muted text-center">&copy; 2015 Nepal Loadshedding Map</p>
    </div>
</footer>
<g:javascript library="application"/>
<r:layoutResources />
</body>
</html>
