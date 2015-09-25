<%--
  Created by IntelliJ IDEA.
  User: saneel
  Date: 9/20/15
  Time: 3:57 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
    <form method="post" action="save" controller="contributor">
        %{--<input type="text" name="username"/>
        <input type="text" name="password"/>--}%
        <input type="text" name="email"/>
        <input type="text" name="contact"/>
        <input type="text" name="address"/>

        <input type="submit" value="save"/>
    </form>
</body>
</html>