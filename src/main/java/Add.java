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


        Expenses exp1 = new Expenses();

        HttpSession session = req.getSession();
        int user_id = (Integer)session.getAttribute("userid");

        exp1.amount = Integer.parseInt(req.getParameter("amount"));
        exp1.category = req.getParameter("category");
        exp1.description = req.getParameter("description");
        exp1.expense_date = req.getParameter("date");

        DBOperations.insertExpenses(user_id, exp1.amount, exp1.category, exp1.description,exp1.expense_date);

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        out.print("<b>Expense inserted successsfully...!</b>");


    }
}
