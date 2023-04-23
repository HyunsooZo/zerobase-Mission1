<%@ page import="com.example.wifiaroundme.WifiApi" %><%--
  Created by IntelliJ IDEA.
  User: hyunsoojo
  Date: 2023/04/18
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    WifiApi api = new WifiApi();
    api.callApi();
    int cnt = api.total;
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Open API 와이파이 정보 가져오기</title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="center">
        <h1><%=cnt%>개의 wifi정보를 가져왔습니다.</h1>
        <a href="index.jsp">홈으로 가기</a>
    </div>
</body>
</html>
