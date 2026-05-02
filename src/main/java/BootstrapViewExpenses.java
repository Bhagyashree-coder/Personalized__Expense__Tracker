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

@WebServlet("/bootstrap_view_expenses")
public class BootstrapViewExpenses extends HttpServlet {

     int a[] = new int[100];
       int i=0;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession();
        Integer user_id = (Integer)session.getAttribute("userid");

        if (user_id == null) {
            resp.sendRedirect("index.jsp");
            //Redirect if session is missing return;
            }


        String fromDate = req.getParameter("from_date");
        String toDate = req.getParameter("to_date");
        String search_category = req.getParameter("search_category");
        String minAmount = req.getParameter("min_price");
        System.out.println(minAmount);
        String maxAmount = req.getParameter("max_price");
        String search_description = req.getParameter("search_description");




           try {
            Connection conObj = DBConnection.establishConnection();

               StringBuilder query = new StringBuilder(
                       "select expense_id, amount, category, description, expense_date from expenses where user_id=?");


               if(fromDate != null && !fromDate.isEmpty()) {
                   query.append(" AND expense_date >= TO_DATE(?, 'YYYY-MM-DD')");
               }

               if(toDate != null && !toDate.isEmpty()) {
                   query.append(" AND expense_date <= TO_DATE(?, 'YYYY-MM-DD')");
               }

               if(search_category != null && !search_category.isEmpty()) {
                   query.append(" AND LOWER(category) LIKE ?");
               }

               if(minAmount != null && !minAmount.isEmpty()) {
                   query.append(" AND amount >= ?");
               }

               if(maxAmount != null && !maxAmount.isEmpty()) {
                   query.append(" AND amount <= ?");
               }

               if(search_description != null && !search_description.isEmpty()) {
                   query.append(" AND LOWER(description) LIKE ?");
               }



             PreparedStatement stmt = conObj.prepareStatement(query.toString());
               int index = 1;
               stmt.setInt(index++, user_id);





               if(fromDate != null && !fromDate.isEmpty())
                   stmt.setString(index++, fromDate);

               if(toDate != null && !toDate.isEmpty())
                   stmt.setString(index++, toDate);

               if(search_category != null && !search_category.isEmpty())
               stmt.setString(index++, "%" + search_category.toLowerCase() + "%");

               if(minAmount != null && !minAmount.isEmpty())
                   stmt.setDouble(index++,Double.parseDouble(minAmount));

               if(maxAmount != null && !maxAmount.isEmpty())
                   stmt.setDouble(index++, Double.parseDouble(maxAmount));

               if(search_description != null && !search_description.isEmpty())
                   stmt.setString(index++, "%" + search_description.toLowerCase() + "%");



             System.out.println(user_id);

           ResultSet rs = stmt.executeQuery();

          // Start of the modern HTML/CSS Output

            out.print("<!DOCTYPE html>");
           out.print("<html lang='en'>");

           out.print("<head>");
           out.print(" <meta charset='UTF-8'>");
        out.print(" <meta name='viewport' content='width=device-width, initial-scale=1.0'>");
           out.print(" <title>Your Expenses | ExpenseTracker</title>");
        out.print(" <link href='https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap' rel='stylesheet'>");
           out.print(" <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css'>");
            out.print(" <style>");
           out.print(" body { margin: 0; font-family: 'Inter', sans-serif; background: linear-gradient(135deg, #fecaca 0%, #fbcfe8 50%, #e9d5ff 100%); min-height: 100vh; display: flex; align-items: center; justify-content: center; color: #1f2937; }");
           out.print(" .dashboard-container { background: rgba(255, 255, 255, 0.7); backdrop-filter: blur(10px); border-radius: 24px; box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1); width: 95%; max-width: 1100px; padding: 40px; }");
           out.print(" header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 40px; }");
            out.print(" h1 { font-size: 28px; font-weight: 700; margin: 0; color: #4338ca; }");
            out.print(" .add-btn { background: #ec4899; color: white; text-decoration: none; padding: 12px 24px; border-radius: 12px; font-weight: 600; display: flex; align-items: center; gap: 8px; border: none; cursor: pointer; transition: 0.3s; }");
             out.print(" .add-btn:hover { background: #db2777; transform: translateY(-2px); }");
             out.print(" table { width: 100%; border-collapse: separate; border-spacing: 0 10px; }");
            out.print(" th { text-align: left; padding: 15px; color: #6b7280; font-weight: 600; text-transform: uppercase; font-size: 13px; letter-spacing: 0.05em; }");
            out.print(" td { padding: 15px; background: rgba(255, 255, 255, 0.8); transition: 0.3s; }");
            out.print(" tr:hover td { background: #fff; }");
      out.print(" td:first-child { border-top-left-radius: 12px; border-bottom-left-radius: 12px; font-weight: 600; color: #6366f1; }");
            out.print(" td:last-child { border-top-right-radius: 12px; border-bottom-right-radius: 12px; }");
           out.print(" .badge { background: #fdf2f8; color: #be185d; padding: 4px 10px; border-radius: 6px; font-size: 12px; font-weight: 600; }");
            out.print(" .action-btns { display: flex; gap: 8px; }");
            out.print(" .btn { border: none; padding: 8px 16px; border-radius: 8px; font-weight: 600; cursor: pointer; transition: 0.2s; font-size: 14px; }");
             out.print(" .btn-edit { background: #e0e7ff; color: #4338ca; }");
             out.print(" .btn-edit:hover { background: #c7d2fe; }");
             out.print(" .btn-delete { background: #fee2e2; color: #dc2626; }");
            out.print(" .btn-delete:hover { background: #fecaca; }");
            out.print(" </style>");
            out.print("</head>");
            out.print("<body>");
          out.print(" <div class='dashboard-container'>");
          out.print(" <header>");

out.print("<div style='text-align: center; margin-bottom: 2rem;'>");
        out.print(" <a href='Bootstrap_dashboard.jsp' style='display: inline-flex; align-items: center; gap: 0.5rem; text-decoration: none; background: #eef2ff; color: #6366f1; padding: 0.6rem 1.2rem; border-radius: 8px; font-weight: 600; font-size: 0.9rem; transition: background 0.2s; font-family: sans-serif;'>");
        out.print("    <span>&larr;</span> Back to Dashboard");
               out.print(" </a>");
                       out.print(" </div>");

            out.print(" <div><h1 align = 'center'>Your Expenses</h1><p style='margin: 5px 0 0; color: #6b7280;'>Manage and track your daily spending effectively.</p></div>");
             out.print(" <button class='add-btn' onclick=\"window.location.href='Bootstrap_add_expense.jsp'\"><i class='fas fa-plus'></i> Add New Expense</button>");
       out.print(" </header>");


//Adding additional functionalities.
               //[ From Date ] [ To Date ] [ Category ▼ ] [ Min ₹ ] [ Max ₹ ] [ Search 🔍 ]

               out.print("<form action = 'bootstrap_view_expenses'>");





               out.print("  <div class=\"filter-container\">");
               out.print("    <div class=\"filter-group\">");
               out.print("      <label>FROM DATE</label>");
               if(fromDate != null && !fromDate.isEmpty()) {
                   out.print("      <input type=\"date\" value = " + fromDate + " name=\"from_date\">");
               }else{
               out.print("      <input type=\"date\" name=\"from_date\">");}
               out.print("    </div>");

               out.print("    <div class=\"filter-group\">");
               out.print("      <label>TO DATE</label>");
               if(toDate != null && !toDate.isEmpty()) {
                   out.print("      <input type=\"date\" value = " + toDate + " name=\"to_date\">");
               }else{
               out.print("      <input type=\"date\" name=\"to_date\">");}
               out.print("    </div>");

               out.print("    <div class=\"filter-group search-group\">");
               out.print("      <label>SEARCH &#128269;</label>");
               if(search_category != null && !search_category.isEmpty()) {
                   out.print("      <input type=\"text\" name=\"search_category\" value = " + search_category + " placeholder=\"Search category...\">");
               }else{
               out.print("      <input type=\"text\" name=\"search_category\" placeholder=\"Search category...\">");}
               out.print("    </div>");

               out.print("    <div class=\"filter-group\">");
               out.print("      <label>MIN &#8377;</label>");
               if(minAmount != null && !minAmount.isEmpty()) {
                   out.print("      <input type=\"number\" value = " + minAmount  + " name=\"min_price\" placeholder=\"0\">");
               }else{
               out.print("      <input type=\"number\" name=\"min_price\" placeholder=\"0\">");}
               out.print("    </div>");

               out.print("    <div class=\"filter-group\">");
               out.print("      <label>MAX &#8377;</label>");
               if(maxAmount != null && !maxAmount.isEmpty()) {
                   out.print("      <input type=\"number\" value = " + maxAmount + " name=\"max_price\" placeholder=\"0\">");
               }else{
               out.print("      <input type=\"number\" name=\"max_price\" placeholder=\"0\">");}
               out.print("    </div>");

               out.print("    <div class=\"filter-group search-group\">");
               out.print("      <label>SEARCH &#128269;</label>");
               if(search_description != null && !search_description.isEmpty()) {
                   out.print("      <input type=\"text\" value = " +   search_description + " name=\"search_description\" placeholder=\"Search description...\">");
               }else{
               out.print("      <input type=\"text\" name=\"search_description\" placeholder=\"Search description...\">");}
               out.print("    </div>");

               out.print("    <div class=\"filter-actions\">");
               out.print("      <button type=\"submit\" class=\"filter-btn\">Apply</button>");
               out.print("      <a href=\"bootstrap_view_expenses\" class=\"reset-btn\" title=\"Reset Filters\">&#8634;</a>");
               out.print("    </div>");

               out.print("  </div>");


// CSS Styling to ensure horizontal layout and matching button styles
               out.print("<style>");
               out.print("  .filter-container { display: flex; flex-direction: row; align-items: flex-end; gap: 1rem; background: #f8faff; padding: 1.25rem; border-radius: 12px; margin-bottom: 2rem; border: 1px solid #edf2f7; font-family: sans-serif; overflow-x: auto; }");
               out.print("  .filter-group { display: flex; flex-direction: column; gap: 0.5rem; flex: 1; min-width: 120px; }");
               out.print("  .filter-group label { font-size: 0.7rem; font-weight: 700; color: #6366f1; text-transform: uppercase; letter-spacing: 0.05em; margin: 0; }");
               out.print("  .filter-group input, .filter-group select { padding: 0.6rem 0.8rem; border: 1px solid #e2e8f0; border-radius: 8px; font-size: 0.85rem; color: #1e293b; outline: none; background: white; height: 40px; box-sizing: border-box; width: 100%; }");
               out.print("  .search-group { flex: 1.5; }");
               out.print("  .filter-actions { display: flex; align-items: center; gap: 0.5rem; margin-bottom: 0px; }");
               out.print("  .filter-btn { background-color: #ec4899; color: white; border: none; padding: 0 1.2rem; border-radius: 8px; font-weight: 600; cursor: pointer; transition: opacity 0.2s; height: 40px; display: flex; align-items: center; justify-content: center; font-size: 14px; min-width: 80px; }");
               out.print("  .filter-btn:hover { opacity: 0.9; }");
               out.print("  .reset-btn { display: flex; align-items: center; justify-content: center; width: 40px; height: 40px; border: 1px solid #e2e8f0; border-radius: 8px; color: #64748b; text-decoration: none; font-size: 1.2rem; background: white; transition: background 0.2s; box-sizing: border-box; }");
               out.print("  .reset-btn:hover { background: #f1f5f9; }");
               out.print("</style>");





                       //Implementing the additional functionalities....


              /* String fromDate = req.getParameter("fromDate");
               String toDate = req.getParameter("toDate");
               String category = req.getParameter("category");
               String minAmount = req.getParameter("minAmount");
               String maxAmount = req.getParameter("maxAmount");
               String search = req.getParameter("search");*/









           out.print(" <table>");
           out.print(" <thead>");
           out.print(" <tr>");
            out.print(" <th>ID</th><th>Amount</th><th>Category</th><th>Description</th><th>Date</th><th style='text-align:center'>Actions</th>");
           out.print(" </tr>");
          out.print(" </thead>");

         out.print(" <tbody>");






               /*while (rs.next()) {

                   a[i] = rs.getInt(1);

                   out.print("   <tr>");
                   out.print("  <td>    " +   rs.getInt(1) + " </td>");
                   out.print("  <td>    " +   rs.getDouble(2)  + "</td>");
                   out.print("  <td>   " +   rs.getString(3)  + "</td>");
                   out.print("  <td>    " +   rs.getString(4)  + "</td>");
                   out.print("  <td>    " +   rs.getDate(5)  + "</td>");
                   out.print("  <td> <form>");
                   out.print("  <input type = hidden name = 'expenseid' value = " +  a[i] + " >");
                   out.print(" <input type = submit value = 'Edit' formaction = 'update'>");
                   out.print("  </td>");
                   out.print(" <td>");
                   out.print(" <input type = hidden name = 'expenseid' value = " +  a[i] + " >");
                   out.print(" <input type = submit value = 'Delete' formaction = 'delete'>");
                   out.print("</form>");
                   out.print("</td>");
                   out.print(" </tr>");
                   i++;
               }*/




               while (rs.next()) {

                   a[i] = rs.getInt(1);

             out.print(" <tr>");
                   out.print(" <td style='font-weight:700'> " + rs.getInt(1) + "</td>");
             out.print(" <td style='font-weight:700'> " + rs.getDouble(2) + "</td>");
             out.print(" <td><span class='badge'>" + rs.getString(3) + "</span></td>");
             out.print(" <td style='color: #4b5563;'>" + rs.getString(4) + "</td>");
             out.print(" <td style='color: #6b7280;'>" + rs.getDate(5) + "</td>");
             out.print(" <td> <form>");


                   out.print("  <input type = hidden name = 'expenseid' value = " +  a[i] + " >");

             out.print(" <button type='submit' formaction='Bootstrap_update_expense.jsp' class='btn btn-edit'><i class='fas fa-edit'></i> Edit</button>");

                   out.print(" <input type = hidden name = 'expenseid' value = " +  a[i] + " >");

             out.print(" <button type='submit' formaction='delete' class='btn btn-delete'><i class='fas fa-trash-can'></i> Delete</button>");
             out.print(" </form>");
             out.print(" </td>");
             out.print(" </tr>");
               i++;
               }

             out.print(" </tbody>");
             out.print(" </table>");
             out.print(" </div>");
            out.print("</body>");
            out.print("</html>");
             conObj.close();
             } catch(Exception e) {
               e.printStackTrace();
            out.print("<p>Error loading data: " + e.getMessage() + "</p>");
           }
    }
}



