<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 11/3/2022
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>Simple Calculator</h1>
  <form action="/calculator" method="post">
    <p>First operand:</p>
    <input name="first_operand" type="text">
    <p>Operator:</p>
    <select name="operator" id="">
      <option value="+">addition</option>
      <option value="-">subtraction</option>
      <option value="*">multiplication</option>
      <option value="/">division</option>
    </select>
    <p>Second operand</p>
    <input name="second_operand" type="text">
    <br>
    <br>
    <button>Submit</button>
  </form>
  </body>
</html>
