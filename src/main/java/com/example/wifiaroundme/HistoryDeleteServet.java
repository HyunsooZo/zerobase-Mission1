package com.example.wifiaroundme;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "delete", value = "/delete/*")
public class HistoryDeleteServet extends HttpServlet {
    private String message;
    public void init() {
        message = "initialized!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        WifiHistoryDBTable db = new WifiHistoryDBTable();
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        String seq = request.getParameter("seq");
        try {
            db.delete(seq);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public void destroy() {
    }
}
