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
    <h1>북마크 그룹 추가</h1>
    <ul class="link">
        <li><a href="index.jsp">홈</a></li>
        <li><a href="inquiry-history.jsp">위치 히스토리 목록</a></li>
        <li><a href="wifi-fetch.jsp">Open API 와이파이 정보 가져오기</a></li>
        <li><a href="bookmark-list.jsp">북마크 보기</a></li>
        <li><a href="group-manage.jsp">북마크 그룹 관리</a></li>
    </ul>
    <table>
        <colgroup>
            <col style="width: 20%" />
            <col />
        </colgroup>
        <tbody>
            <tr>
                <th scope="row">북마크 이름</th>
                <td><input type="text" id="nm" name="nm"></td>
            </tr>
            <tr>
                <th scope="row">순서</th>
                <td><input type="text" id="seq" name="seq"></td>
            </tr>
            <tr>
                <td colspan="2" class="center">
                    <button type="button" onclick="addGroup()">추가</button>
                </td>
            </tr>
        </tbody>
    </table>
</body>
<script>
    document.getElementById('nm').onchange = function() {
        this.value = document.getElementById('nm').value;
    };
    document.getElementById('seq').onchange = function() {
        this.value = document.getElementById('seq').value;
    };
    function addGroup() {
        $.ajax({
            type: "GET",
            cache: false,
            url: "insert-group",
            data: {
                nm: document.getElementById("nm").value,
                seq: document.getElementById("seq").value
            },
            success: function (response) {
                alert("등록이 완료되었습니다.")
                window.location.assign("group-manage.jsp")
            },
            error: function (xhr, status, error) {
                alert("등록에 실패하였습니다.");
            }
        });
    }
</script>
</html>
