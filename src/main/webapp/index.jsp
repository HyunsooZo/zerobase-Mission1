<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wifi 정보</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-size: 12px;
        }

        body {
            margin: 10px;
        }

        h1 {
            margin: 20px 0;
            font-size: 2rem;
        }

        .link {
            display: flex;
            align-items: center;
            margin: 0 0 15px 0;
            list-style: none;
        }

        .link li + li {
            position: relative;
            margin-left: 6px;
            padding-left: 6px;
        }

        .link li + li:before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            width: 1px;
            height: 60%;
            background: #000;
            transform: translateY(-50%);
        }

        .table-top {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .table-top span {
            display: inline-flex;
            align-items: center;
        }

        .table-top span + span {
            margin-left: 4px;
        }

        input[type=text], button {
            height: 12px;
            padding: 5px 10px;
            box-sizing: content-box;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 5px;
            border: 1px solid #eee;
        }

        thead th {
            border-width: 0 1px;
            bordercolor: #fff;
            background: #01aa6f;
            color: #fff;
        }

        .nodata {
            text-align: center;
        }

        input[type=submit] {
            height: 12px;
            padding: 5px 10px;
            box-sizing: content-box;
        }
    </style>
</head>
<body>
<h1>와이파이 정보 구하기</h1>

<ul class="link">
    <li><a href="index.jsp">홈</a></li>
    <li><a href="locationHistory.jsp">위치 히스토리 목록</a></li>
    <li><a href="fetchWifi.jsp">Open API 와이파이 정보 가져오기</a></li>
</ul>

<div class="table-top">
        <span>
            <label for="lat">LAT : </label>
            <input type="text" id="lat" name="lat">
        </span>
    <span>
            <label for="lnt">LNT : </label>
            <input type="text" id="lnt" name="lnt">
        </span>
    <span>
            <button onclick="getLocation()">내 위치 가져오기</button>
        </span>
    <span>
             <button onclick="callServlet()">근처 wifi 정보 가져오기</button>
        </span>
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
        }
    </script>
</div>
<table>
    <thead>
    <tr>
        <th>거리(Km)</th>
        <th>관리번호</th>
        <th>자치구</th>
        <th>와이파이명</th>
        <th>도로명주소</th>
        <th>상세주소</th>
        <th>설치위치(층)</th>
        <th>설치유형</th>
        <th>설치기관</th>
        <th>서비스구분</th>
        <th>망종류</th>
        <th>설치년도</th>
        <th>실내외 구분</th>
        <th>WIFI접속 환경</th>
        <th>X좌표</th>
        <th>Y좌표</th>
        <th>작업일자</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan="17" class="nodata">위치정보를 입력한 후에 조회해주세요</td>
    </tr>
    </tbody>

</table>
</body>
</html>
