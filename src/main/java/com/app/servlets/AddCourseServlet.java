package com.app.servlets;

import com.app.util.DBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/addCourse")
public class AddCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseName = request.getParameter("courseName");
        String description = request.getParameter("description");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String schedule = request.getParameter("schedule");

        try (Connection connection = DBUtil.getConnection()) {
            String sql = "INSERT INTO courses (course_name, description, capacity, schedule) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, courseName);
            statement.setString(2, description);
            statement.setInt(3, capacity);
            statement.setString(4, schedule);
   
            statement.executeUpdate();
            response.sendRedirect("adminHome.jsp?success=true");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("adminHome.jsp?error=true");
        }
    }
}
