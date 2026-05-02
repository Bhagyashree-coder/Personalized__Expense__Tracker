import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Expenses;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/add")
public class Add extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        Expenses exp1 = new Expenses();

        HttpSession session = req.getSession();
        int user_id = (Integer)session.getAttribute("userid");

        exp1.amount = Integer.parseInt(req.getParameter("amount"));
        exp1.category = req.getParameter("category");
        exp1.description = req.getParameter("description");
        exp1.expense_date = req.getParameter("date");

        out.print("<html>");
        out.print("<body>");
                out.print("<form>");
                out.print(" <input type = hidden name='amount' value= " + exp1.amount + ">");
                out.print(" <input type = hidden name='category' value=" +  exp1.category + ">");
                out.print(" <input type = hidden name='description' value=" +    exp1.description + ">");
                out.print(" <input type = hidden name='date' value=" +    exp1.expense_date + ">");
                out.print("</form>");
                out.print(" </body>");
                out.print("</html>");

        DBOperations.insertExpenses(user_id, exp1.amount, exp1.category, exp1.description,exp1.expense_date);






        session.setAttribute("expense","true");
     System.out.println("Expense Inserted.");

        req.getRequestDispatcher("Bootstrap_add_expense.jsp").forward(req, resp);






    }
}
