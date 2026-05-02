import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login_verification")
public class LoginVerification extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String action_value = req.getParameter("action_value");
        System.out.println(action_value);

        if(action_value.equals("login")) {
            String username = req.getParameter("username");
            String password = req.getParameter("password");

            out.print("<html>");
            out.print("<body>");
            out.print("<form>");
            out.print(" <input type = hidden name='amount' value= " + username + ">");
            out.print(" <input type = hidden name='category' value=" +  password + ">");
            out.print("</form>");
            out.print(" </body>");
            out.print("</html>");

            try {
                Connection conObj = DBConnection.establishConnection();
                System.out.println(conObj);
                String query = "select name , password ,user_id from user_for_expense_tracker where name = ? and password = ? ";

                PreparedStatement stmt = conObj.prepareStatement(query);
                stmt.setString(1, username);
                stmt.setString(2, password);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    HttpSession session = req.getSession();
                    session.setAttribute("userid",rs.getInt(3));

                    resp.sendRedirect("Bootstrap_dashboard.jsp");

                } else {
                    HttpSession session = req.getSession();
                    session.setAttribute("verification","false");
                    resp.sendRedirect("index.jsp");
                }




                conObj.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if(action_value.equals("signup")) {

            Users user = new Users();

            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String email = req.getParameter("email");

            out.print("<html>");
            out.print("<body>");
            out.print("<form>");
            out.print(" <input type = hidden name='amount' value= " + username + ">");
            out.print(" <input type = hidden name='category' value=" +  password + ">");
            out.print(" <input type = hidden name='category' value=" +  email + ">");
            out.print("</form>");
            out.print(" </body>");
            out.print("</html>");

           DBOperations.insertUsers(username,password,email);

            try {
                Connection conObj = DBConnection.establishConnection();
                System.out.println(conObj);
                String query = "select   user_id from user_for_expense_tracker where name = ? and password = ? ";

                PreparedStatement stmt = conObj.prepareStatement(query);
                stmt.setString(1, username);
                stmt.setString(2, password);

                ResultSet rs = stmt.executeQuery();



if(rs.next()) {
    System.out.println(rs.getInt(1));
    HttpSession session = req.getSession();
    session.setAttribute("userid", rs.getInt(1));
    resp.sendRedirect("Bootstrap_dashboard.jsp");
}
else {

    System.out.println("User not found after signup");
}



                conObj.close();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }






    }
}
