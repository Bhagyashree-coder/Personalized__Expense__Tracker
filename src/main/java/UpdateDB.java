import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/update_db")
public class UpdateDB extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        int expense = Integer.parseInt(req.getParameter("expenseid"));
        double amount = Double.parseDouble(req.getParameter("amount"));
        String cat = req.getParameter("category");
       String des = req.getParameter("description");
       String date =req.getParameter("date");


        out.print("<html>");
        out.print("<body>");
        out.print("<form>");
        out.print(" <input type = hidden name='amount' value= " + amount + ">");
        out.print(" <input type = hidden name='category' value=" +  cat + ">");
        out.print(" <input type = hidden name='description' value=" +  des + ">");
        out.print(" <input type = hidden name='date' value=" +    date + ">");
        out.print("</form>");
        out.print(" </body>");
        out.print("</html>");


       DBOperations. updateExpense(expense,amount,cat,des,date);



        HttpSession session = req.getSession();
        session.setAttribute("edit","true");

        req.getRequestDispatcher("Bootstrap_update_expense.jsp").forward(req, resp);



    }
}
