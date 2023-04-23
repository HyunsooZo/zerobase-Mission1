<%@ page import="com.example.wifiaroundme.BookMarkTB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>북마크 삭제</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h1>북마크 삭제</h1>
<div class="table-top">
<ul class="link">
    <li><a href="index.jsp">홈</a></li>
    <li><a href="location-history.jsp">위치 히스토리 목록</a></li>
    <li><a href="fetch-wifi.jsp">Open API 와이파이 정보 가져오기</a></li>
    <li><a href="view-bookmark.jsp">북마크 보기</a></li>
    <li><a href="manage-bm_group.jsp">북마크 그룹 관리</a></li>
</ul>

</div>
<p>북마크를 삭제 하시겠습니까?</p>
<br>
<%
    int sequence = Integer.parseInt(request.getParameter("param"));
    BookMarkTB bm = new BookMarkTB();
    ArrayList<String> bmList = bm.inquiry().get(sequence);
%>
<table>
    <colgroup>
        <col style="width: 20%" />
        <col />
    </colgroup>
    <tbody>
    <tr>
        <th scope="row">북마크 이름</th>
        <td><%=bmList.get(1)%></td>
    </tr>
    <tr>
        <th scope="row">와이파이 명</th>
        <td><%=bmList.get(2)%></td>
    </tr>
    <tr>
        <th scope="row">등록일자</th>
        <td><%=bmList.get(3)%></td>
    </tr>
    <tr>
        <td colspan="2" class="center">
            <a href="view-bookmark.jsp">돌아가기</a> <button onclick = "deleteRow()">삭제</button></td>
    </tr>
    </tbody>
</table>
</body>
<script>
    function deleteRow(seqNum){
        $.ajax({
            type: "GET",
            cache: false,
            url: "delete-bookmark",
            data: {
                seq: <%=bmList.get(0)%>
            },
            success: function (response) {
                alert("삭제 완료");
                window.location.assign("view-bookmark.jsp");
            },
            error: function (xhr, status, error) {
                alert("삭제 실패");
            }
        });
    }

</script>
</html>
