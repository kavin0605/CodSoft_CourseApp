package com.app.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.app.util.DBUtil;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("user");
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        try (Connection connection = DBUtil.getConnection()) {
            // Check if the student is already registered for the course
            String checkSql = "SELECT * FROM registrations WHERE student_id = (SELECT id FROM students WHERE username = ?) AND course_id = ?";
            PreparedStatement checkStatement = connection.prepareStatement(checkSql);
            checkStatement.setString(1, username);
            checkStatement.setInt(2, courseId);
            ResultSet checkResult = checkStatement.executeQuery();
            
            if (checkResult.next()) {
                response.sendRedirect("Courses.jsp?error=alreadyRegistered");
                return;
            }

            // Check course capacity
            String capacityCheckSql = "SELECT capacity, (SELECT COUNT(*) FROM registrations WHERE course_id = ?) AS registered FROM courses WHERE id = ?";
            PreparedStatement capacityCheckStatement = connection.prepareStatement(capacityCheckSql);
            capacityCheckStatement.setInt(1, courseId);
            capacityCheckStatement.setInt(2, courseId);
            ResultSet capacityCheckResult = capacityCheckStatement.executeQuery();
            
            if (capacityCheckResult.next()) {
                int capacity = capacityCheckResult.getInt("capacity");
                int registered = capacityCheckResult.getInt("registered");

                if (registered < capacity) {
                    String sql = "INSERT INTO registrations (student_id, course_id) VALUES ((SELECT id FROM students WHERE username = ?), ?)";
                    PreparedStatement statement = connection.prepareStatement(sql);
                    statement.setString(1, username);
                    statement.setInt(2, courseId);
                    statement.executeUpdate();
                    
                    // Update course capacity
                    String updateCapacitySql = "UPDATE courses SET capacity = capacity - 1 WHERE id = ?";
                    PreparedStatement updateCapacityStatement = connection.prepareStatement(updateCapacitySql);
                    updateCapacityStatement.setInt(1, courseId);
                    updateCapacityStatement.executeUpdate();
                    
                    
                    response.sendRedirect("Courses.jsp?success=true");
                } else {
                    response.sendRedirect("Courses.jsp?error=full");
                }
            } else {
                response.sendRedirect("Courses.jsp?error=true");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Courses.jsp?error=true");
        }
    }
}

