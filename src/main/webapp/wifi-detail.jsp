<%@ page import="com.example.wifiaroundme.WifiApi" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.wifiaroundme.GroupTB" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    int selectedRow = Integer.parseInt(request.getParameter("row"));
    WifiApi wifi = new WifiApi();
    ArrayList<String> detailed = wifi.result.get(selectedRow);

    GroupTB groupTB = new GroupTB();
    ArrayList<ArrayList<String>> selectList = groupTB.inquiry();
%>
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
        <li><a href="location-history.jsp">위치 히스토리 목록</a></li>
        <li><a href="fetch-wifi.jsp">Open API 와이파이 정보 가져오기</a></li>
        <li><a href="view-bookmark.jsp">북마크 보기</a></li>
        <li><a href="manage-bm_group.jsp">북마크 그룹 관리</a></li>
    </ul>

    <div class="table-top">
        <span>
            <select id="selectedGroup">
                <option value="북마크 그룹 이름 선택" >북마크 그룹 이름 선택</option>
                <%
                    for(int i = 0 ; i < selectList.size() ; i++){
                %>
                <option value="<%=selectList.get(i).get(1)%>"> <%=selectList.get(i).get(1)%></option>
                <%}%>
            </select>
        </span>
        <span>
            <button onclick="addBookMark()">북마크 추가하기</button>
        </span>
    </div>


    <table>
        <tbody>
            <tr>
                <th scope="row">거리(Km)</th>
                <td><%=detailed.get(0).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">관리번호</th>
                <td><%=detailed.get(1).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">자치구</th>
                <td><%=detailed.get(2).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">와이파이명</th>
                <td><%=detailed.get(3).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">도로명주소</th>
                <td><%=detailed.get(4).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">상세주소</th>
                <td><%=detailed.get(5).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">설치위치(층)</th>
                <td><%=detailed.get(6).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">설치유형</th>
                <td><%=detailed.get(7).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">설치기관</th>
                <td><%=detailed.get(8).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">서비스구분</th>
                <td><%=detailed.get(9).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">망종류</th>
                <td><%=detailed.get(10).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">설치년도</th>
                <td><%=detailed.get(11).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">실내외 구분</th>
                <td><%=detailed.get(12).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">WIFI접속 환경</th>
                <td><%=detailed.get(13).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">X좌표</th>
                <td><%=detailed.get(14).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">Y좌표</th>
                <td><%=detailed.get(15).replace("\"","")%></td>
            </tr>
            <tr>
                <th scope="row">작업일자</th>
                <td><%=detailed.get(16).replace("\"","")%></td>
            </tr>
        </tbody>
    </table>
</body>
<script>

    function addBookMark(){
        var selectBox = document.getElementById("selectedGroup");
        var selectedValue = selectBox.options[selectBox.selectedIndex].value;
        var wifiNm=<%=detailed.get(3)%>;
        $.ajax({
            type: "GET",
            cache: false,
            url: "insert-bookmark",
            data: {
                group: selectedValue,
                wifiName: wifiNm
            },
            success: function (response) {
                alert("추가 완료");
                window.location.assign("view-bookmark.jsp")
            },
            error: function (xhr, status, error) {
                alert("추가 실패");
            }
        });
    }
</script>
</html>
