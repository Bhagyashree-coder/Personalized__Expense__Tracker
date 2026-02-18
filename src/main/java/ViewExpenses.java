import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/view_expenses")
public class ViewExpenses extends HttpServlet {
    static int a[] = new int[100];
    static   int i=0;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();
        int user_id = (Integer)session.getAttribute("userid");

        try
        {
            Connection conObj = DBConnection.establishConnection();

            String query = "select expense_id,amount,category,description,expense_date from expenses where user_id=?";

            PreparedStatement stmt = conObj.prepareStatement(query);
            stmt.setInt(1,user_id);

            ResultSet rs = stmt.executeQuery();





out.print("<html>");
out.print(" <body>");
out.print("<table>");
out.print(" <tr>");
out.print(" <th> Expense Id </th>");
out.print(" <th> Amount </th>");
out.print("  <th> Category </th>");
out.print("<th> Description</th>");
out.print("<th> Expense Date </th>");
out.print("<th> Update Expense </th>");
out.print("<th>  Delete Expense </th>");
out.print(" </tr>");

                while (rs.next()) {
            a[i] = rs.getInt(1);

            out.print("   <tr>");
            out.print("  <td>    " +   rs.getInt(1) + " </td>");
            out.print("  <td>    " +   rs.getDouble(2)  + "</td>");
            out.print("  <td>   " +   rs.getString(3)  + "</td>");
            out.print("  <td>    " +   rs.getString(4)  + "</td>");
            out.print("  <td>    " +   rs.getString(5)  + "</td>");
            out.print("  <td> <form>");
            out.print("  <input type = hidden name = 'expenseid' value = " +  a[i] + " >");
            out.print("  <input type = submit value = 'Edit' formaction = 'updatedb'>");
            out.print("  </td>");
            out.print(" <td>");
            out.print(" <input type = hidden name = 'expenseid' value = " +  a[i] + " >");
            out.print(" <input type = submit value = 'Delete' formaction = 'delete'>");
            out.print("</form>");
            out.print("</td>");
            out.print(" </tr>");
            i++;
        }

                out.print("</table>");
                out.print("  </body>");
                out.print(" </html>");



                conObj.close();

        }catch(Exception e)
        {
            e.printStackTrace();
        }


    }
}
