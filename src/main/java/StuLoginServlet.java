


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class StuLoginServlet extends HttpServlet {
	Connection con;
	@Override
	public void init(ServletConfig Config )
	{
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/course_app","root", "root");
		}

		catch (Exception e) {
			e.printStackTrace();

		}

	}


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out =response.getWriter();

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try {

			PreparedStatement st = con.prepareStatement("select * from student_list where stuName = '"+username+"' and password = '"+password+"'");
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
				//String name = rs.getString("name");
				out.println("Success");
				response.setContentType("text/html");
				out.println("<a href=\"/CourseApp/CourseDetail.jsp\"> Click here to view Courses </a>");

			} else {
				out.println("invalid...");
				
				 
			}

			rs.close();
			st.close();

		} catch (Exception e) {
			out.println(e);

		}

	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	 @Override
	public void destroy()
	{
		try {
    	con.close();
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}