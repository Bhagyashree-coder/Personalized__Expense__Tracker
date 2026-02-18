import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login_verification")
public class LoginVerification extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");

        if(action.equals("login")) {
            String username = req.getParameter("username");
            String password = req.getParameter("password");

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

                    resp.sendRedirect("Dashboard.jsp");

                } else {
                    resp.sendRedirect("SignUp.jsp");
                }




                conObj.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if(action.equals("signup")) {

            Users user = new Users();

            String username = req.getParameter("name");
            String password = req.getParameter("pass");
            String email = req.getParameter("email");

           DBOperations.insertUsers(username,password,email);

             resp.sendRedirect("Dashboard.jsp");
        }






    }
}
