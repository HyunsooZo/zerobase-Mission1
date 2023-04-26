# zerobase-Mission1
zerobase bootcamp Mission 1 - 
fetching public Wifi List by current location using OpenAPI provided by SeoulOpenApi

### DB 및 API 클래스를 별도로 만들어 각 서블릿에서 (또는 JSP에서) 인스턴스화하여 사용

| Title           | Describtion                           |
|-----------------|---------------------------------------|
| BookMarkDBTable | DB 내 북마크 관리 테이블 (삽입/삭제/조회 메서드)        |
| GroupDBTable    | DB 내 북마크그룹 관리 테이블 (삽입/삭제/업데이트/조회 메서드) |
| HistoryDBTable  | DB 내 북마크 관리 테이블 (삽입/삭제/조회 메서드)        |
| WifiApi         | 서울시 OpenWifi 호출 메서드                   |

---

### DB 삽입/삭제/업데이트 또는 WifiList api 리스트 호출의 경우 별도의 servlet을 만들어 JSP에서 호출

| Title                   | Describtion                                      |
|-------------------------|--------------------------------------------------|
| BookMarkDeleteServlet   | 북마크 컬럼 삭제 서블릿                                    |
| BookMarkInsertServlet   | 북마스 컬럽 삽입 서블릿                                    |
| GroupDeleteServlet      | 북마크 그룹 컬럼 삭제 서블릿                                 |
| GroupEditServlet        | 북마크 그룹 컬럽 업데이트 서블릿                               |
| GroupInsertServlet      | 북마크 그룹 컬럼 삽입 서블릿                                 |
| HistoryDeleteServet     | 조회기록 삭제 서블릿                                      |
| HistoryInsertServlet    | 조회기록 삽입 서블릿                                      |
| WifiFetchServlet        | 와이파이 API 호출결과 정제(가까운순 20개) 및 HTML 업데이트 서블릿       |

---

### DB 조회 및 조회기록 조회, Open Api호출의 경우 JSP에서 import하여 직접 호출
### JSP 목록 
| Title               | Describtion                                             |
|---------------------|---------------------------------------------------------|
| bookmark-delete.jsp | 북마크 삭제 화면 (BookMarkDeleteServlet 호출)                    |
| bookmark-list.jsp   | 북마크 리스트 화면 (BookMarkDBTable의 조회 메서드 호출)                 |
| group-add.jsp       | 그룹 추가 화면 (GroupInsertServlet 호출)                        |
| group-manage.jsp    | 그룹 조회 화면 (GroupDBTable 조회 메서드 ,GroupDeleteServlet 호출)   |
| group-modify.jsp    | 그룹 수정 화면 (GroupEditServlet 호출)                          |
| index.jsp           | 진입 화면                                                   
|                     | (와이파이목록조회시 WifiFetchServlet 호출하여 html 코드변경)             |
|                     | (목록조회 시 입력된 좌표 담아 HistoryInsertServlet 호출)              |
| inquiry-history.jsp | 조회히스토리 화면 (HistoryDBTable 조회 메서드, HistoryDeleteServet 호출) |
| wifi-detail.jsp     | 상세화면 (BookMarkInsertServlet 호출 ,GroupDBTable 조회 메서드 호출) |
| wifi-fetch.jsp      | OpenAPi 가져오기 화면 (WifiApi 내 api호출 메서드 호출)                |
| style.css           | 스타일 css                                                 |




