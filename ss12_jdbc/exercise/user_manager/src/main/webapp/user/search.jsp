<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/7/2022
  Time: 11:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>User Management</h1>
<h2>
    <a href="/user?action=create">Add New User</a>
</h2>
<h2>
    <form action="/user?action=search" method="post">
        <input type="text" placeholder="Search country">

    </form></h2>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>Result search</h2></caption>
        <tr>
            <th>STT</th>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${userList}"  varStatus="status">
            <tr>
                <td> ${status.count}</td>
                <td> ${user.getId()}</td>
                <td> ${user.getName()}</td>
                <td> ${user.getEmail()}</td>
                <td> ${user.getCountry()}</td>
                <td>
                    <a href="/user?action=edit&id=${user.id}">Edit</a>
                    <a href="/user?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
