package com.example.wifiaroundme;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;


@WebServlet(name = "delete-group", value = "/delete-group/*")
public class GRDeleteServet extends HttpServlet {
    private String message;

    public void init() {
        message = "initialized!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        boolean isDeleted = false;
        GroupTB db = new GroupTB();
        response.setCharacterEncoding("UTF-8");
        String seq = request.getParameter("seq");
        try {
            db.delete(seq);
            isDeleted = true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        if (isDeleted) {
            isDeleted = false;
            ArrayList<ArrayList<String>> newList;
            try {
                newList = db.inquiry();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            PrintWriter out = response.getWriter();
            out.print("삭제 완료");
        }
    }
    public void destroy() {
    }
}
