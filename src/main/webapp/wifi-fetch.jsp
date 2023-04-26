<%@ page import="com.example.wifiaroundme.WifiApi" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    WifiApi api = new WifiApi();
    api.callApi();
    int cnt = api.total;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Open API 와이파이 정보 가져오기</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <div class="center">
        <h1><%=cnt%>개의 wifi정보를 가져왔습니다.</h1>
        <a href="index.jsp">홈으로 가기</a>
    </div>
</body>
</html>
