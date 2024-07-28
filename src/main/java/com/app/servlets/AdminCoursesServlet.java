package com.app.servlets;

import com.app.util.DBUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin")
public class AdminCoursesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("viewCourses".equals(action)) {
            try (Connection connection = DBUtil.getConnection()) {
                String sql = "SELECT id, course_name, description, capacity, schedule FROM courses";
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet resultSet = statement.executeQuery();

                List<Course> courses = new ArrayList<>();
                while (resultSet.next()) {
                    Course course = new Course();
                    course.setId(resultSet.getInt("id"));
                    course.setCourseName(resultSet.getString("course_name"));
                    course.setDescription(resultSet.getString("description"));
                    course.setCapacity(resultSet.getInt("capacity"));
                    course.setSchedule(resultSet.getString("schedule"));
                    courses.add(course);
                }

                request.setAttribute("courses", courses);
                request.getRequestDispatcher("viewCourses.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect("adminHome.jsp?error=true");
            }
        }
    }

    public static class Course {
        private int id;
        private String courseName;
        private String description;
        private int capacity;
        private String schedule;

        // Getters and setters
        public int getId() {
            return id;
        }
        public void setId(int id) {
            this.id = id;
        }
        public String getCourseName() {
            return courseName;
        }
        public void setCourseName(String courseName) {
            this.courseName = courseName;
        }
        public String getDescription() {
            return description;
        }
        public void setDescription(String description) {
            this.description = description;
        }
        public int getCapacity() {
            return capacity;
        }
        public void setCapacity(int capacity) {
            this.capacity = capacity;
        }
        public String getSchedule() {
            return schedule;
        }
        public void setSchedule(String schedule) {
            this.schedule = schedule;
        }
    }
}
