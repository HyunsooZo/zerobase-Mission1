package com.example.wifiaroundme;

import java.sql.*;
import java.util.ArrayList;


public class WifiHistoryTB {

    private static final String DATABASE_URL = "jdbc:mariadb://localhost:3306/JHSDB";
    private static final String USERNAME = "jhs";
    private static final String PASSWORD = "1234";

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
        pstmt = conn.prepareStatement("INSERT INTO INQRY_HISTORY (SEQ_NO, LAT_INQUIRED, LNT_INQUIRED, DT_INQUIRED) VALUES (0, ?, ?, NOW())");
        pstmt.setString(1, b);
        pstmt.setString(2, c);
        pstmt.executeUpdate();
    }

    public static void delete(String a) throws SQLException, ClassNotFoundException {
        conn = getConnection();
        pstmt = conn.prepareStatement("DELETE FROM INQRY_HISTORY WHERE SEQ_NO = ?");
        pstmt.setInt(1, Integer.parseInt(a));
        pstmt.executeUpdate();

        pstmt = conn.prepareStatement("ALTER TABLE INQRY_HISTORY AUTO_INCREMENT = 1");
        pstmt.executeUpdate();
    }

    public static ArrayList<ArrayList<String>> inquiry() throws SQLException, ClassNotFoundException {

        conn = getConnection();
        pstmt = conn.prepareStatement("SELECT * FROM INQRY_HISTORY");
        rs = pstmt.executeQuery();
        ArrayList<ArrayList<String>> historyList = new ArrayList<>();
        while (rs.next()) {
            ArrayList<String> history = new ArrayList<>();
            history.add(rs.getString("SEQ_NO"));
            history.add(rs.getString("LAT_INQUIRED"));
            history.add(rs.getString("LNT_INQUIRED"));
            history.add(rs.getString("DT_INQUIRED"));
            historyList.add(history);
        }
        return historyList;
    }
}
