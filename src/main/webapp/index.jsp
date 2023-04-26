<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wifi 정보</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <h1>와이파이 정보 구하기</h1>
    <ul class="link">
        <li><a href="index.jsp">홈</a></li>
        <li><a href="inquiry-history.jsp">위치 히스토리 목록</a></li>
        <li><a href="wifi-fetch.jsp">Open API 와이파이 정보 가져오기</a></li>
        <li><a href="bookmark-list.jsp">북마크 보기</a></li>
        <li><a href="group-manage.jsp">북마크 그룹 관리</a></li>
    </ul>
    <div class="table-top">
        <span>
            <label for="lat">LAT : </label>
            <input type="text" id="lat" name="lat" placeholder="0.0">
        </span>
        <span>
            <label for="lnt">LNT : </label>
            <input type="text" id="lnt" name="lnt" placeholder="0.0">
        </span>
        <span>
            <button type="button" onclick="getLocation()">내 위치 가져오기</button>
        </span>
        <span>
             <button type="button" onclick="callServlet()">근처 wifi 정보 가져오기</button>
        </span>
    </div>
    <table>
        <thead>
            <tr>
                <th scope="col">거리(Km)</th>
                <th scope="col">관리번호</th>
                <th scope="col">자치구</th>
                <th scope="col">와이파이명</th>
                <th scope="col">도로명주소</th>
                <th scope="col">상세주소</th>
                <th scope="col">설치위치(층)</th>
                <th scope="col">설치유형</th>
                <th scope="col">설치기관</th>
                <th scope="col">서비스구분</th>
                <th scope="col">망종류</th>
                <th scope="col">설치년도</th>
                <th scope="col">실내외 구분</th>
                <th scope="col">WIFI접속 환경</th>
                <th scope="col">X좌표</th>
                <th scope="col">Y좌표</th>
                <th scope="col">작업일자</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="17" class="nodata">위치정보를 입력한 후에 조회해주세요</td>
            </tr>
        </tbody>
    </table>
</body>
<script>
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    }
    function showPosition(position) {
        document.getElementById("lat").value = position.coords.latitude;
        document.getElementById("lnt").value = position.coords.longitude;
    }
    document.getElementById('lat').onchange = function() {
        this.value = document.getElementById('lat').value;
    };
    document.getElementById('lnt').onchange = function() {
        this.value = document.getElementById('lnt').value;
    };
    function callServlet() {
        $.ajax({
            type: "GET",
            cache: false,
            url: "hello-servlet",
            data: {
                lat: document.getElementById("lat").value,
                lnt: document.getElementById("lnt").value
            },
            success: function (response) {
                $("table tbody").html(response); // 테이블 내부 HTML을 교체
            },
            error: function (xhr, status, error) {
                alert("Open wifi 정보가져오기를 클릭 하신 후 위도/경도를 입력하고 다시 시도해주세요");
            }
        });
        $.ajax({
            type: "GET",
            cache: false,
            url: "insert",
            data: {
                lat: document.getElementById("lat").value,
                lnt: document.getElementById("lnt").value
            },
            success: function (response) {
                console.log(response)
            },
            error: function (xhr, status, error) {
                console.log(xhr, status, error)
            }
        });
    }
</script>
</html>
