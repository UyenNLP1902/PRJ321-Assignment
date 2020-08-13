<%-- 
    Document   : viewCart
    Created on : Mar 20, 2020, 4:50:28 PM
    Author     : SE140355
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
    </head>
    <body>
        <h1>View Your Cart</h1>

        <c:set var="cart" value="${sessionScope.CART}"/>
        <c:if test="${not empty cart.items}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Title</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                <form action="removeBook">
                    <c:forEach var="item" items="${cart.items}" 
                               varStatus="counter">
                        <tr>
                            <td>
                                ${counter.count}
                            </td>
                            <td>
                                ${item.key}
                            </td>
                            <td>
                                ${item.value}
                            </td>
                            <td>
                                <input type="checkbox" name="chkItem" 
                                       value="${item.key}" />
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="3">
                            <a href="bookMarket.html">Add More Books To Your Cart</a>
                        </td>
                        <td>
                            <input type="submit" value="Remove Selected Books" 
                                   name="btnAction" />
                        </td>
                    </tr>
                </form>
            </tbody>
        </table><br>

        <form action="checkout">
            Customer* <input type="text" name="txtCustomer" value="${param.txtCustomer}" />
            <input type="submit" value="Check Out" name="btnAction" />

        </form>
        <c:set var="error" value="${requestScope.CHECKOUTERROR}"/>
        <c:if test="${not empty error.customerNameIsEmpty}">
            <font color="red">
            ${error.customerNameIsEmpty}
            </font>
        </c:if>

    </c:if>
    <c:if test="${empty cart.items}">
        <h2>No cart is exist!</h2>
        <a href="bookMarket.html">Click here to add more book</a>
    </c:if>

</body>
</html>
