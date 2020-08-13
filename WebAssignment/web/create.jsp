<%-- 
    Document   : create
    Created on : Mar 19, 2020, 9:57:25 PM
    Author     : SE140355
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Sign Up Page</h1>

        <form action="create" method="POST">
            <c:set var="errors" value="${requestScope.CREATEERRORS}"/>
            Username* <input type="text" name="txtUsername" 
                             value="${param.txtUsername}" />(6 - 30 chars)<br>
            <c:if test="${not empty errors.usernameLengthErr}">
                <font color="red">
                ${errors.usernameLengthErr}
                </font>
            </c:if><br>            
            Password* <input type="password" name="txtPassword" value="" />(6 - 20 chars)<br>
            <c:if test="${not empty errors.passwordLengthErr}">
                <font color="red">
                ${errors.passwordLengthErr}
                </font>
            </c:if><br>
            Confirm* <input type="password" name="txtConfirm" value="" /><br>
            <c:if test="${not empty errors.confirmNotMatched}">
                <font color="red">
                ${errors.confirmNotMatched}
                </font>
            </c:if><br>
            Full name* <input type="text" name="txtFullname" 
                              value="${param.txtFullname}" />(2 - 50 chars)<br>
            <c:if test="${not empty errors.fullnameLengthErr}">
                <font color="red">
                ${errors.fullnameLengthErr}
                </font>
            </c:if><br>
            <input type="submit" value="Create New Acount" name="btnAction" />
            <input type="reset" value="Reset" /><br>

            <c:if test="${not empty errors.usernameIsExisted}">
                <font color="red">
                ${errors.usernameIsExisted}
                </font>
            </c:if><br>
        </form><br>

    </body>
</html>
