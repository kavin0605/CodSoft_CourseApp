package com.app.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.app.util.DBUtil;

import mypack.Course;

@WebServlet("/registeredCourses")
public class RegisteredCoursesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("user");

        try  {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DBUtil.getConnection();
            String sql = "SELECT c.id, c.course_name, c.description, c.capacity, c.schedule FROM courses c JOIN registrations r ON c.id = r.course_id JOIN students s ON r.student_id = s.id WHERE s.username = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            List<Course> registeredCourses = new ArrayList<>();
            while (resultSet.next()) {
                Course course = new Course();
                course.setId(resultSet.getInt("id"));
                course.setCourseName(resultSet.getString("course_name"));
                course.setDescription(resultSet.getString("description"));
                course.setCapacity(resultSet.getInt("capacity"));
                course.setSchedule(resultSet.getString("schedule"));
                registeredCourses.add(course);
            }

            request.setAttribute("registeredCourses", registeredCourses);
            request.getRequestDispatcher("registeredCourses.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
