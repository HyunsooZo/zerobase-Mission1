package com.example.wifiaroundme;

import java.io.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Comparator;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class WifiFetchServlet extends HttpServlet {
    public ArrayList<ArrayList<String>> tableComp;

    private String message;
    public void init() {
        message = "initialized!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        WifiApi api = new WifiApi();
        tableComp = api.result;
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        StringBuilder answer = new StringBuilder();
        PrintWriter out = response.getWriter();
        int size = tableComp.size();


        Double x = Double.parseDouble(request.getParameter("lat"));
        Double y = Double.parseDouble(request.getParameter("lnt"));
        for (int i = 0; i < size ; i++) {
            double x2 = Double.parseDouble(tableComp.get(i).get(14).replaceAll("\"",""));
            double y2 = Double.parseDouble(tableComp.get(i).get(15).replaceAll("\"",""));
            DecimalFormat near = new DecimalFormat("#.####");
            tableComp.get(i).set(0, near.format(Math.sqrt((Math.pow(x-x2,2) +(Math.pow(y-y2,2))))));
        }
        tableComp.sort(Comparator.comparing(o -> o.get(0), Comparator.nullsLast(Comparator.naturalOrder())));

        if(tableComp.size()>20) size = 20;

        for (int i = 0; i < size; i++) {
            answer.append("<tr>\n");
            answer.append("<td>"+tableComp.get(i).get(0).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(1).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(2).replace("\"","")+"</td>\n");
            answer.append("<td><a href='wifi-detail.jsp?row="+i+"'>"+tableComp.get(i).get(3).replace("\"","")+"</a></td>\n");
            answer.append("<td>"+tableComp.get(i).get(4).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(5).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(6).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(7).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(8).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(9).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(10).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(11).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(12).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(13).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(14).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(15).replace("\"","")+"</td>\n");
            answer.append("<td>"+tableComp.get(i).get(16).replace("\"","")+"</td>\n");
            answer.append("</tr>");
        }
        out.print(answer.toString());
    }

    public void destroy() {
    }
}