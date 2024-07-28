package com.app.servlets;

import com.app.util.DBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/deleteCourse")
public class DeleteCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        try (Connection connection = DBUtil.getConnection()) {
            String sql = "DELETE FROM courses WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, courseId);
            statement.executeUpdate();
            System.out.println("course- deleted");
            response.sendRedirect("listCourses.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("listCourses?error=true");
        }
    }
}
