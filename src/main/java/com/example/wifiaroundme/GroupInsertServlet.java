package com.example.wifiaroundme;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "insert-group", value = "/insert-group/*")
public class GroupInsertServlet extends HttpServlet {
    private String message;
    public void init() {
        message = "initialized!";
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        GroupDBTable db = new GroupDBTable();
        String x = request.getParameter("nm");
        String y = request.getParameter("seq");
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
