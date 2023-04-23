<%@ page import="com.example.wifiaroundme.GroupTB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="static com.google.gson.stream.JsonToken.NULL" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>북마크 그룹관리</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h1>북마크 그룹 관리</h1>

<ul class="link">
    <li><a href="index.jsp">홈</a></li>
    <li><a href="location-history.jsp">위치 히스토리 목록</a></li>
    <li><a href="fetch-wifi.jsp">Open API 와이파이 정보 가져오기</a></li>
    <li><a href="view-bookmark.jsp">북마크 보기</a></li>
    <li><a href="manage-bm_group.jsp">북마크 그룹 관리</a></li>
</ul>
<div class="table-top">
<button onclick="moveToAdd()">북마크 그룹 이름 추가</button>
</div>
<table>
    <colgroup>
        <col style="width: 20%"/>
        <col/>
    </colgroup>
    <thead>
    <tr>
        <th>ID</th>
        <th>북마크 이름</th>
        <th>순서</th>
        <th>등록일자</th>
        <th>수정일자</th>
        <th>비고</th>
    </tr>
    </thead>
    <tbody>
    <%
        GroupTB group = new GroupTB();
        ArrayList<ArrayList<String>> list = group.inquiry();
        if (list.size() == 0) {%>
    <tr>
        <td colspan="6" class="nodata">등록된 북마크 그룹이 없습니다..</td>
    </tr>
    <%
    } else {
        for (ArrayList<String> ar : list) {
    %>
    <tr>
        <td><%=ar.get(0).replace("\"", "")%>
        </td>
        <td><%=ar.get(1).replace("\"", "")%>
        </td>
        <td><%=ar.get(2).replace("\"", "")%>
        </td>
        <td><%=ar.get(3).replace("\"", "")%>
        </td>
        <td><%=ar.get(4)==null?"":ar.get(4).replace("\"", "")%>
        </td>
        <td class="center">
            <a href="edit-group.jsp?param1=<%=ar.get(0).replace("\"", "")%>" >수정</a>
            <a href="#" onclick="deleteGroup(<%=ar.get(0).replace("\"", "")%>)">삭제</a>
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
    function moveToAdd() {
        window.location.assign("add-group.jsp")
    }
    function deleteGroup(seqNum) {
        $.ajax({
            type: "GET",
            cache: false,
            url: "delete-group",
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
