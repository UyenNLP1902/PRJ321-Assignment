<%-- 
    Document   : search
    Created on : Mar 18, 2020, 6:49:40 PM
    Author     : SE140355
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body>
        <c:if test="${empty sessionScope}">
            <c:redirect url="login.html"/>
        </c:if>
        <c:if test="${not empty sessionScope}">
            <font color="red">
            Welcome, ${sessionScope.FULLNAME}
            </font>

            <h1>Search Page</h1>
            <form action="search">
                Search Value <input type="text" name="txtSearchValue" 
                                    value="${param.txtSearchValue}" />
                <input type="submit" value="Search" name="btnAction" />
            </form><br>

            <c:set var="searchValue" value="${param.txtSearchValue}"/>

            <c:if test="${not empty searchValue}">
                <c:set var="searchResult" value="${requestScope.SEARCHRESULT}"/>
                <c:if test="${not empty searchResult}">
                    <table border="1">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Username</th>
                                <th>Password</th>
                                <th>Full name</th>
                                <th>Role</th>
                                <th>Delete</th>
                                <th>Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" items="${searchResult}" varStatus="counter">
                            <form action="update">
                                <tr>
                                    <td>
                                        ${counter.count}
                                    </td>
                                    <td>
                                        ${dto.username}
                                        <input type="hidden" name="txtUsername" 
                                               value="${dto.username}" />
                                    </td>
                                    <td>
                                        <input type="password" name="txtPassword" 
                                               value="${dto.password}" />

                                    </td>
                                    <td>
                                        ${dto.lastname}
                                    </td>
                                    <td>
                                        <input type="checkbox" name="chkAdmin" value="ADMIN" 
                                               <c:if test="${dto.role}">
                                                   checked="checked"
                                               </c:if>
                                               />
                                    </td>
                                    <td>
                                        <c:url var="urlRewritting" value="delete">
                                            <c:param name="username" value="${dto.username}"/>
                                            <c:param name="lastSearchValue" value="${searchValue}"/>
                                        </c:url>
                                        <a href="${urlRewritting}">Delete</a>
                                    </td>
                                    <td>
                                        <input type="submit" value="Update" 
                                               name="btnAction" />
                                        <input type="hidden" name="lastSearchValue" 
                                               value="${searchValue}" />
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty searchResult}">
                <h2>No record is matched!</h2>
            </c:if>
        </c:if>
        <br>
        <form action="logout">
            <input type="submit" value="Logout" name="btnAction" />
        </form>
    </c:if>
</body>
</html>
