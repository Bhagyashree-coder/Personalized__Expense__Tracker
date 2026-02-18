import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/update_db")
public class UpdateDB extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int expense = Integer.parseInt(req.getParameter("expenseid"));
        double amount = Double.parseDouble(req.getParameter("amount"));
        String cat = req.getParameter("category");
       String des = req.getParameter("description");
       String date =req.getParameter("date");


       DBOperations. updateExpense(expense,amount,cat,des,date);

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        out.print("<h3>Expense updated successsfully...!</h3>");



    }
}
