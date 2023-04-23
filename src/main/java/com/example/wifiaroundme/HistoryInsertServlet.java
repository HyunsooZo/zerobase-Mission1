package com.example.wifiaroundme;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


@WebServlet(name = "insert", value = "/insert/*")
public class HistoryInsertServlet extends HttpServlet {
    private String message;
    public void init() {
        message = "initialized!";
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        WifiHistoryTB db = new WifiHistoryTB();
        String x = request.getParameter("lat");
        String y = request.getParameter("lnt");
        try {
            db.insert(x,y);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        PrintWriter out = response.getWriter();
        out.print("삽입성공!");
    }
    public void destroy() {
    }
}
