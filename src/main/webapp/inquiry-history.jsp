<%@ page import="com.example.wifiaroundme.WifiHistoryDBTable" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>위치 히스토리 목록</title>
  <link href="style.css" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <h1>위치 히스토리 목록</h1>
    <ul class="link">
        <li><a href="index.jsp">홈</a></li>
        <li><a href="inquiry-history.jsp">위치 히스토리 목록</a></li>
        <li><a href="wifi-fetch.jsp">Open API 와이파이 정보 가져오기</a></li>
        <li><a href="bookmark-list.jsp">북마크 보기</a></li>
        <li><a href="group-manage.jsp">북마크 그룹 관리</a></li>
    </ul>
    <table>
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">X 좌표</th>
                <th scope="col">Y 좌표</th>
                <th scope="col">조회일자</th>
                <th scope="col">비고</th>
            </tr>
        </thead>
        <tbody>
            <%
                WifiHistoryDBTable wifidb = new WifiHistoryDBTable();
                ArrayList<ArrayList<String>> result= wifidb.inquiry();
                if(result.size()==0){
            %>
            <tr>
                <td colspan="5" class="nodata">wifi 조회 기록이 존재하지 않습니다.</td>
            </tr>
            <%
                }else{
                    for(ArrayList<String> al : result){
            %>
            <tr>
                <td><%=al.get(0).replace("\"","")%></td>
                <td><%=al.get(1).replace("\"","")%></td>
                <td><%=al.get(2).replace("\"","")%></td>
                <td><%=al.get(3).replace("\"","")%></td>
                <td class="center">
                  <button type="button" onclick="deleteRow(<%=al.get(0).replace("\"","")%>)">삭제</button>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</body>
<script>
    function deleteRow(seqNum){
        $.ajax({
            type: "GET",
            cache: false,
            url: "delete",
            data: {
                seq: seqNum
            },
            success: function (response) {
                alert("삭제 완료");
                location.reload(); // 페이지 새로고침
            },
            error: function (xhr, status, error) {
                alert("삭제 실패");
            }
        });
    }
</script>
</html>
