package com.app.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.app.util.DBUtil;

@WebServlet("/dropCourse")
public class DropCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("user");
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        try (Connection connection = DBUtil.getConnection()) {
            String sql = "DELETE FROM registrations WHERE student_id = (SELECT id FROM students WHERE username = ?) AND course_id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setInt(2, courseId);
            
            
            
            
            int rowsDeleted = statement.executeUpdate();

            if (rowsDeleted > 0) {
                // Update course capacity
                String updateCapacitySql = "UPDATE courses SET capacity = capacity + 1 WHERE id = ?";
                PreparedStatement updateCapacityStatement = connection.prepareStatement(updateCapacitySql);
                updateCapacityStatement.setInt(1, courseId);
                updateCapacityStatement.executeUpdate();
            }  
            
            
            response.sendRedirect("registeredCourses");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
    
}
