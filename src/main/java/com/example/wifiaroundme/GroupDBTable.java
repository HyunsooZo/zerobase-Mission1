package com.example.wifiaroundme;

import java.sql.*;
import java.util.ArrayList;


public class GroupDBTable {

    private static final String DATABASE_URL = "jdbc:mariadb://localhost:3306/JHSDB";
    private static final String USERNAME = "jhs";
    private static final String PASSWORD = "1234";
    static ArrayList<ArrayList<String>> historyList;
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
    //DB에 연결 (BookMark Table CRUD 시 호출)
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
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

    //테이블에 삽입 (GroupInsertServlet)
    public static void insert(String b, String c) throws SQLException, ClassNotFoundException {
        conn = getConnection();
        pstmt = conn.prepareStatement("INSERT INTO GROUP_TABLE (GR_SEQ_NO, GR_NM, GR_PRIORITY, GR_DT_RGSTRED) VALUES (0, ?, ?, NOW())");
        pstmt.setString(1, b);
        pstmt.setInt(2, Integer.parseInt(c));
        pstmt.executeUpdate();
    }

    //컬럼 수정 (GroupEditServlet)
    public static void update(String a, String b,String c) throws SQLException, ClassNotFoundException {
        conn = getConnection();
        pstmt = conn.prepareStatement("UPDATE GROUP_TABLE SET GR_NM = ?, GR_PRIORITY =?, GR_DT_MDFIED =NOW() WHERE GR_SEQ_NO = ?");
        pstmt.setString(1, a);
        pstmt.setInt(2, Integer.parseInt(b));
        pstmt.setInt(3, Integer.parseInt(c));
        pstmt.executeUpdate();
    }

    //컬럼 삭제 (GroupDeleteServlet)
    public static void delete(String a) throws SQLException, ClassNotFoundException {
        conn = getConnection();
        pstmt = conn.prepareStatement("DELETE FROM GROUP_TABLE WHERE GR_SEQ_NO = ?");
        pstmt.setInt(1, Integer.parseInt(a));
        pstmt.executeUpdate();

        pstmt = conn.prepareStatement("ALTER TABLE GROUP_TABLE AUTO_INCREMENT = 1");
        pstmt.executeUpdate();
    }

    //테이블 조회 (group-manage.jsp)
    public static ArrayList<ArrayList<String>> inquiry() throws SQLException, ClassNotFoundException {

        conn = getConnection();
        pstmt = conn.prepareStatement("SELECT * FROM GROUP_TABLE");
        rs = pstmt.executeQuery();
        historyList = new ArrayList<>();
        while (rs.next()) {
            ArrayList<String> history = new ArrayList<>();
            history.add(rs.getString("GR_SEQ_NO"));
            history.add(rs.getString("GR_NM"));
            history.add(rs.getString("GR_PRIORITY"));
            history.add(rs.getString("GR_DT_RGSTRED"));
            history.add(rs.getString("GR_DT_MDFIED"));
            historyList.add(history);
        }
        //ArrayList<ArrayList<String>> 에 담아 리턴
        return historyList;
    }
}
