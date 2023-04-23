package com.example.wifiaroundme;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "edit-group", value = "/edit-group/*")
public class GREditServlet extends HttpServlet {
    private String message;
    public void init() {
        message = "initialized!";
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        GroupTB db = new GroupTB();
        String x = request.getParameter("nm");
        String y = request.getParameter("seq");
        String z = request.getParameter("id");
        try {
            db.update(x,y,z);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        PrintWriter out = response.getWriter();
        out.print("수정성공!");
    }
    public void destroy() {
    }
}
