import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/updatedb")
public class Update extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        out.print("<html>");
                out.print("  <body>");
                        out.print("<form action = 'update_db'>");

                                out.print("   <h2> Update your Expenses </h2>");


        int exp = Integer.parseInt(req.getParameter("expenseid"));


        try
        {
            Connection conObj = DBConnection.establishConnection();

            String query = "select amount,category,description,expense_date from expenses where expense_id = ?";

            PreparedStatement stmt = conObj.prepareStatement(query);
            stmt.setInt(1,exp);

            ResultSet rs = stmt.executeQuery();
            rs.next();




            out.print("<input type = hidden name = 'expenseid' value = " +  exp + ">");

            out.print("Amount : <input type = number name = 'amount' value =" +rs.getInt(1) + ">");
            out.print(" <br><br>");
             out.print("Category : <input type = text name = 'category' value = " +rs.getString(2)+">");
             out.print(" <br><br>");
              out.print(" Description :  <textarea id='description'");
              out.print(" name='description'");
              out.print(" rows='5'");
              out.print(" cols='40'");
              out.print(" placeholder='Write your description here..'>");
            out.print(rs.getString(3) );
            out.print(" </textarea>");
            out.print(" <br><br>");
             out.print("  Expense Date : <input type = date name = 'date' value ="+rs.getString(4)+">");
             out.print(" <br><br>");



                conObj.close();

        }catch(Exception e)
        {
            e.printStackTrace();
        }



        out.print("<input type = submit >");
                out.print(" </form>");
                        out.print(" </body>");
                                out.print("  </html>");
    }
}
