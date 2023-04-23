package com.example.wifiaroundme;

import java.sql.*;
import java.util.ArrayList;

public class GroupTB {

    private static final String DATABASE_URL = "jdbc:mariadb://localhost:3306/JHSDB";
    private static final String USERNAME = "jhs";
    private static final String PASSWORD = "1234";
    static ArrayList<ArrayList<String>> historyList;
    static Connection conn = null;
    static PreparedStatement pstmt = null;
    static ResultSet rs = null;
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


    public static void insert(String b, String c) throws SQLException, ClassNotFoundException {
        conn = getConnection();
        pstmt = conn.prepareStatement("INSERT INTO BM_GROUP (SEQ_NO, BM_NM, BM_PRIORITY, DT_RGSTRED) VALUES (0, ?, ?, NOW())");
        pstmt.setString(1, b);
        pstmt.setInt(2, Integer.parseInt(c));
        pstmt.executeUpdate();
    }
    public static void update(String a, String b,String c) throws SQLException, ClassNotFoundException {
        conn = getConnection();
        pstmt = conn.prepareStatement("UPDATE BM_GROUP SET BM_NM = ?, BM_PRIORITY =?, DT_MDFIED =NOW() WHERE SEQ_NO = ?");
        pstmt.setString(1, a);
        pstmt.setInt(2, Integer.parseInt(b));
        pstmt.setInt(3, Integer.parseInt(c));
        pstmt.executeUpdate();
    }


    public static void delete(String a) throws SQLException, ClassNotFoundException {
        conn = getConnection();
        pstmt = conn.prepareStatement("DELETE FROM BM_GROUP WHERE SEQ_NO = ?");
        pstmt.setInt(1, Integer.parseInt(a));
        pstmt.executeUpdate();

        pstmt = conn.prepareStatement("ALTER TABLE BM_GROUP AUTO_INCREMENT = 1");
        pstmt.executeUpdate();
    }

    public static ArrayList<ArrayList<String>> inquiry() throws SQLException, ClassNotFoundException {

        conn = getConnection();
        pstmt = conn.prepareStatement("SELECT * FROM BM_GROUP");
        rs = pstmt.executeQuery();
        historyList = new ArrayList<>();
        while (rs.next()) {
            ArrayList<String> history = new ArrayList<>();
            history.add(rs.getString("SEQ_NO"));
            history.add(rs.getString("BM_NM"));
            history.add(rs.getString("BM_PRIORITY"));
            history.add(rs.getString("DT_RGSTRED"));
            history.add(rs.getString("DT_MDFIED"));
            historyList.add(history);
        }
        return historyList;
    }
}
