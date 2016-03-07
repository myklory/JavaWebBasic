package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by myklory on 2016/3/7.
 */
//1. 继承于HttpServlet
public class HelloServlet extends HttpServlet {
    //2. 重写doGet或者doPost
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("处理Post请求...");
        PrintWriter printWriter = resp.getWriter();
        resp.setContentType("text/html; charset=utf-8");
        printWriter.println("<strong style='color:red;'>Hello Servlet</strong>");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("处理Get请求...");
        PrintWriter printWriter = resp.getWriter();
        resp.setContentType("text/html; charset=utf-8");
        printWriter.println("<strong>Hello Servlet</strong>");
    }
}
