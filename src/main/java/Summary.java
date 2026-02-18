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

@WebServlet("/summary")
public class Summary extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();


        try {
            Connection conObj = DBConnection.establishConnection();

            String query = "select category,sum(amount) from expenses group by category ";
            PreparedStatement stmt = conObj.prepareStatement(query);

            ResultSet rs = stmt.executeQuery();




out.print("<html>");
        out.print("<body>");

                out.print(" <h1> Expenses Summary (Category Wise) </h1>");

                out.print(" <table>");

                out.print( "<tr>");
                out.print(  "<td>Category</td>");
                out.print(  "<td>Total Amount</td>");
                out.print( "</tr>");

                 while(rs.next())
            {

                out.print( "<tr>");
                        out.print( "<td> " +  rs.getString(1)  + "</td>");
                        out.print( "<td> " + rs.getDouble(2)  + "</td>");
                        out.print(" </tr>");


            }


            out.print("</table>");
                    out.print( "  </body>");
                    out.print( "</html>");


                    conObj.close();

        }catch(Exception e)
        {
            e.printStackTrace();
        }






    }
}
