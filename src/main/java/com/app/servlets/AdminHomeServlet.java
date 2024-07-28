package com.app.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/adminHome")
public class AdminHomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("admin");
        
        if ("user".equals(username)) {
            request.getRequestDispatcher("adminHome.jsp").forward(request, response);
        } else {
            response.sendRedirect("admin.jsp?error=true");
        }
    }
}
