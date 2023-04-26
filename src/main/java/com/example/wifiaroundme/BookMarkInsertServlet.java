package com.example.wifiaroundme;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "insert-bookmark", value = "/insert-bookmark/*")
public class BookMarkInsertServlet extends HttpServlet {
    private String message;
    public void init() {
        message = "initialized!";
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        BookMarkDBTable db = new BookMarkDBTable();
        String x = request.getParameter("group");
        String y = request.getParameter("wifiName");
        String z = request.getParameter("rowNum");
        try {
            db.insert(x,y,z);
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
