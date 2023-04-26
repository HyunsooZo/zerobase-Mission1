package com.example.wifiaroundme;

import java.sql.*;
import java.util.ArrayList;

public class BookMarkDBTable {

    private static final String DATABASE_URL = "jdbc:mariadb://localhost:3306/JHSDB";
    private static final String USERNAME = "jhs";
    private static final String PASSWORD = "1234";

    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;

    //DB에 연결 (BookMark Table CRUD 시 호출)
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        //연결되어 있지 않은 상태일 경우에만 연결
        if (conn == null) {
            try {
                Class.forName("org.mariadb.jdbc.Driver");
                conn = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                throw e;
            } catch (SQLException e) {
                e.printStackTrace();
                throw e;
            }
        }
        return conn;
    }

    //컬럼 삽입 (BookMarkInsertServlet)
    public static void insert(String b, String c, String d) throws SQLException, ClassNotFoundException {
        conn = getConnection();
        pstmt = conn.prepareStatement("INSERT INTO BOOKMARK_TABLE (SEQ_NO, BM_NM, WIFI_NM, DT_INQUIRED , WIFI_ID) VALUES (0, ?, ?, NOW(),?)");
        pstmt.setString(1, b);
        pstmt.setString(2, c);
        pstmt.setString(3, d);
        pstmt.executeUpdate();
    }

    //컬럼 삭제 (BookMarkDeleteServlet)
    public static void delete(String a) throws SQLException, ClassNotFoundException {
        conn = getConnection();
        pstmt = conn.prepareStatement("DELETE FROM BOOKMARK_TABLE WHERE SEQ_NO = ?");
        pstmt.setInt(1, Integer.parseInt(a));
        pstmt.executeUpdate();

        pstmt = conn.prepareStatement("ALTER TABLE BOOKMARK_TABLE AUTO_INCREMENT = 1");
        pstmt.executeUpdate();
    }

    //테이블 조회 (bookmark-list.jsp에서 호출)
    public static ArrayList<ArrayList<String>> inquiry() throws SQLException, ClassNotFoundException {

        conn = getConnection();
        pstmt = conn.prepareStatement("SELECT * FROM BOOKMARK_TABLE");
        rs = pstmt.executeQuery();
        ArrayList<ArrayList<String>> historyList = new ArrayList<>();
        while (rs.next()) {
            ArrayList<String> history = new ArrayList<>();
            history.add(rs.getString("SEQ_NO"));
            history.add(rs.getString("BM_NM"));
            history.add(rs.getString("WIFI_NM"));
            history.add(rs.getString("DT_INQUIRED"));
            history.add(rs.getString("WIFI_ID"));
            historyList.add(history);
        }
        // ArrayList<ArrayList<String>> 에 담아 반환
        return historyList;
    }
}
