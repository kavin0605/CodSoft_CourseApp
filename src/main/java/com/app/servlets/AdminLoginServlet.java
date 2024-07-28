package com.app.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("admin".equals(username) && "user".equals(password)) {
            request.getSession().setAttribute("admin", username);
            response.sendRedirect("adminHome.jsp");
        } else {
            response.sendRedirect("admin.jsp?error=true");
        }
    }
}
