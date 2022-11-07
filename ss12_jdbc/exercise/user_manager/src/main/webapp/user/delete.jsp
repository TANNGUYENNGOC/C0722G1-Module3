<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/7/2022
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>Delete are you ok ??</h1>
    <h2>
        <a href="/user">List All Users</a>
    </h2>
</center>
<div align="center">
    <form method="post" action="/user?action=delete">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit User
                </h2>
            </caption>
            <%--            <c:if test="${user != null}">--%>
            <%--                <input type="hidden" name="id" value="<c:out value='${user.id}' />"/>--%>
            <%--            </c:if>--%>
            <tr>
                <th>id:</th>
                <td><input type="hidden" name="id" value="${user.getId()}">không cho thấy id há há</td>
            </tr>
            <tr>
                <th>User Name:</th>
                <td>
                    <input readonly type="text" name="name" value="${user.getName()}"/>
                </td>
            </tr>
            <tr>
                <th>User Email:</th>
                <td>
                    <input readonly type="text" name="email" value="${user.getEmail()}"
                    />
                </td>
            </tr>
            <tr>
                <th>Country:</th>
                <td>
                    <input readonly type="text" name="country" size="15"
                           value="${user.getCountry()}"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button>Remove</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
