<%@ page import="com.example.wifiaroundme.BookMarkTB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>북마크 목록</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <h1>북마크 목록</h1>
    <ul class="link">
        <li><a href="index.jsp">홈</a></li>
        <li><a href="location-history.jsp">위치 히스토리 목록</a></li>
        <li><a href="fetch-wifi.jsp">Open API 와이파이 정보 가져오기</a></li>
        <li><a href="view-bookmark.jsp">북마크 보기</a></li>
        <li><a href="manage-bm_group.jsp">북마크 그룹 관리</a></li>
    </ul>

    <table>
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">북마크 이름</th>
                <th scope="col">와이파이 명</th>
                <th scope="col">등록일자</th>
                <th scope="col">비고</th>
            </tr>
        </thead>
        <tbody>
        <%
            BookMarkTB homedb = new BookMarkTB();
            ArrayList<ArrayList<String>> result= homedb.inquiry();
            if(result.size()==0){%>
        <tr>
            <td colspan="5" class="nodata">북마크가 존재하지 않습니다.</td>
        </tr>
        <%}else
        {for(int i = 0 ; i < result.size() ;i ++){
        %>
        <tr>
            <td><%=result.get(i).get(0).replace("\"","")%></td>
            <td><%=result.get(i).get(1).replace("\"","")%></td>
            <td><%=result.get(i).get(2).replace("\"","")%></td>
            <td><%=result.get(i).get(3).replace("\"","")%></td>
            <td class="center">
                <a href="delete-bookmark.jsp?param=<%=String.valueOf(i)%>"> 삭제 </a>
            </td>
        </tr>

        <%}
        }%>
        </tbody>
    </table>
</body>
</html>
