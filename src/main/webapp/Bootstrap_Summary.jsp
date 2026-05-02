<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>


<%


        try
        {
           Connection con = null;



                   String oracleDriver = "oracle.jdbc.driver.OracleDriver";
                   String oracleUrl = "jdbc:oracle:thin:@localhost:1521:xe";
                   String userName = "system";
                   String password = "24122005";


                       //Register Driver.
                       Class.forName(oracleDriver);

                       //Create Connection.
                        con = DriverManager.getConnection(oracleUrl, userName, password);






%>

<%
String monthParam = request.getParameter("month");
String yearParam = request.getParameter("year");

int selectedMonth;
int selectedYear;

if(monthParam != null && yearParam != null) {
    selectedMonth = Integer.parseInt(monthParam);
    selectedYear = Integer.parseInt(yearParam);
} else {
    java.time.LocalDate now = java.time.LocalDate.now();
    selectedMonth = now.getMonthValue();
    selectedYear = now.getYear();
}

String update = request.getParameter("updateBtn");
%>





<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>ExpenseTracker - Financial Overview</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#3b82f6",
                        "background-light": "#f9fafb",
                        "background-dark": "#0f172a",
                        "accent": "#ec4899",
                        "warm-brown": "#1e293b",
                    },
                    fontFamily: {
                        "display": ["Inter", "sans-serif"]
                    },
                    borderRadius: {"DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px"},
                },
            },
        }</script>
<style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .custom-scrollbar::-webkit-scrollbar {
            width: 6px;
        }
        .custom-scrollbar::-webkit-scrollbar-track {
            background: transparent;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #e5dcdf;
            border-radius: 10px;
        }
    </style>
</head>
<body class="dark:bg-background-dark text-warm-brown dark:text-slate-100 font-display min-h-screen bg-slate-50">
<div class="layout-container flex h-full grow flex-col">

<br>

<!-- Hero Section: Total Monthly Spending -->
<section class="grid grid-cols-1 md:grid-cols-3 gap-6">
<div class="md:col-span-2 flex flex-col justify-center gap-2">
<h6 class="text-warm-brown dark:text-slate-100 text-3xl font-black tracking-tight">Monthly Financial Overview</h6>



<%
    java.time.LocalDate now = java.time.LocalDate.now();
    int currentMonth = now.getMonthValue();  // 1-12
    int currentYear = now.getYear();
%>



<!-- Top Navigation -->
<form method="get">
<main class="max-w-[1200px] mx-auto w-full px-6 py-8 flex flex-col gap-8"><section class="flex flex-col md:flex-row md:items-center justify-between gap-4 p-6 bg-white border rounded-xl shadow-sm">
<div class="flex flex-col gap-1">

<div style='margin-bottom: 2rem;'>
  <a href='Bootstrap_dashboard.jsp' style='display: inline-flex; align-items: center; gap: 0.5rem; text-decoration: none; background: #eef2ff; color: #6366f1; padding: 0.6rem 1.2rem; border-radius: 8px; font-weight: 600; font-size: 0.9rem; transition: background 0.2s; font-family: sans-serif;'>
   <span>&larr;</span> Back to Dashboard
  </a>
</div>

<h3 class="text-xs font-bold uppercase tracking-widest text-warm-brown/60">View Another Period</h3>
<p class="text-sm text-warm-brown/40">Select a specific month and year to update your overview</p>
</div>
<div class="flex items-center gap-4">
<div class="flex flex-col gap-1">
<label class="sr-only" for="month-select">Month</label>
<select name="month" class="form-select block w-full rounded-lg border-slate-200 text-sm font-semibold focus:border-blue-500 focus:ring-blue-500" id="month-select">

<%
if(update != null)
{
   if(request.getParameter("month") != null && request.getParameter("year") != null)
   {
   %>

              <option value="1" <%= selectedMonth == 1 ? "selected" : "" %>>January</option>
               <option value="2" <%= selectedMonth == 2 ? "selected" : "" %>>February</option>
               <option value="3" <%= selectedMonth == 3 ? "selected" : "" %>>March</option>
               <option value="4" <%= selectedMonth == 4 ? "selected" : "" %>>April</option>
               <option value="5" <%= selectedMonth == 5 ? "selected" : "" %>>May</option>
               <option value="6" <%= selectedMonth == 6 ? "selected" : "" %>>June</option>
               <option value="7" <%= selectedMonth == 7 ? "selected" : "" %>>July</option>
               <option value="8" <%= selectedMonth == 8 ? "selected" : "" %>>August</option>
               <option value="9" <%= selectedMonth == 9 ? "selected" : "" %>>September</option>
               <option value="10" <%= selectedMonth == 10 ? "selected" : "" %>>October</option>
               <option value="11" <%= selectedMonth == 11 ? "selected" : "" %>>November</option>
               <option value="12" <%= selectedMonth == 12 ? "selected" : "" %>>December</option>

               <%
               }
                 }




else{
%>

    <option value="1" <%= currentMonth == 1 ? "selected" : "" %>>January</option>
    <option value="2" <%= currentMonth == 2 ? "selected" : "" %>>February</option>
    <option value="3" <%= currentMonth == 3 ? "selected" : "" %>>March</option>
    <option value="4" <%= currentMonth == 4 ? "selected" : "" %>>April</option>
    <option value="5" <%= currentMonth == 5 ? "selected" : "" %>>May</option>
    <option value="6" <%= currentMonth == 6 ? "selected" : "" %>>June</option>
    <option value="7" <%= currentMonth == 7 ? "selected" : "" %>>July</option>
    <option value="8" <%= currentMonth == 8 ? "selected" : "" %>>August</option>
    <option value="9" <%= currentMonth == 9 ? "selected" : "" %>>September</option>
    <option value="10" <%= currentMonth == 10 ? "selected" : "" %>>October</option>
    <option value="11" <%= currentMonth == 11 ? "selected" : "" %>>November</option>
    <option value="12" <%= currentMonth == 12 ? "selected" : "" %>>December</option>
    <%
    }%>

</select>
</div>
<div class="flex flex-col gap-1">
<label class="sr-only" for="year-select">Year</label>
<select name="year" class="form-select block w-full rounded-lg border-slate-200 text-sm font-semibold focus:border-blue-500 focus:ring-blue-500" id="year-select">




<%
if(update != null)
{
   if(request.getParameter("month") != null && request.getParameter("year") != null)
   {





for(int y = 2030; y >= 2001; y--){
%>
    <option value="<%= y %>" <%= selectedYear == y ? "selected" : "" %>>
        <%= y %>
    </option>
<%
}



   }}
   else{








for(int y = 2030; y >= 2001; y--){
%>
    <option value="<%= y %>" <%= currentYear == y ? "selected" : "" %>>
        <%= y %>
    </option>
<%
}}
%>


</select>


</div>
<button name="updateBtn" value="1"
class="px-4 py-2 bg-blue-600 text-white rounded-lg text-sm font-bold hover:bg-blue-700 transition-colors shadow-sm shadow-blue-200">
Update
</button>
</div>
</section>
</form>



</div>
<div class="flex flex-col gap-2 rounded-xl p-8 bg-white border shadow-sm relative overflow-hidden group">
<p class="text-warm-brown/60 text-sm font-bold uppercase tracking-widest">Total Monthly Spending</p>


<%

  Integer user_id = (Integer)session.getAttribute("userid");



String query = "SELECT SUM(amount) FROM expenses WHERE user_id = ? AND expense_date >= TO_DATE(? || '-' || ? || '-01','YYYY-MM-DD') AND expense_date < ADD_MONTHS(TO_DATE(? || '-' || ? || '-01','YYYY-MM-DD'), 1)";

            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1,user_id);

            stmt.setInt(2, selectedYear);
            stmt.setInt(3, selectedMonth);

            stmt.setInt(4, selectedYear);
            stmt.setInt(5, selectedMonth);

            ResultSet rs = stmt.executeQuery();
            rs.next();

       Double    total_monthly_expense = rs.getDouble(1);

%>













<p class="tracking-tighter text-5xl font-black leading-tight text-blue-600"><%=total_monthly_expense%> </p><b>rs.</b>

</div>
</section>
<div class="grid grid-cols-1 lg:grid-cols-12 gap-8">

<%

 user_id = (Integer)session.getAttribute("userid");
 query = "select category, sum(amount) from expenses where  user_id=? and expense_date >= TO_DATE(? || '-' || ? || '-01','YYYY-MM-DD') AND expense_date < ADD_MONTHS(TO_DATE(? || '-' || ? || '-01','YYYY-MM-DD'), 1) group by category";
         stmt = con.prepareStatement(query);
           stmt.setInt(1,user_id);

           stmt.setInt(2, selectedYear);
           stmt.setInt(3, selectedMonth);

           stmt.setInt(4, selectedYear);
           stmt.setInt(5, selectedMonth);

             rs = stmt.executeQuery();


%>


<!-- Category-wise Spending Table -->



<section class="lg:col-span-5 flex flex-col gap-4">
<div class="flex items-center justify-between">
<h2 class="text-warm-brown dark:text-slate-100 text-xl font-extrabold tracking-tight">Category-wise Spending</h2>
</div>
<div class="bg-white rounded-xl border shadow-sm overflow-hidden">
<table class="w-full text-left border-collapse">
<thead>



<tr class="">
<th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-warm-brown/60">    Category</th>
<th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-warm-brown/60 text-right">Amount</th>
<th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-warm-brown/60">Share</th>
</tr>
</thead>
<tbody class="divide-y">


<%
while(rs.next()) {

        %>

<tr class="transition-colors group">
<td class="px-6 py-4">
<div class="flex items-center">

<span class="font-semibold text-sm"><%=rs.getString(1)%></span>
</div>
</td>
<td class="px-6 py-4 text-right font-bold text-sm"><%=rs.getDouble(2)%></td>
<td class="px-6 py-4">
<div class="flex items-center gap-3">
<div class="flex-1 h-1.5 rounded-full bg-slate-100 overflow-hidden">

<%
double percentage = 0;
if(total_monthly_expense != 0){
    percentage = (100 * rs.getDouble(2)) / total_monthly_expense;
}
%>


<div class="h-full bg-emerald-500 rounded-full"
     style="width: <%= percentage %>%;">
</div>




</div>

<span class="text-xs font-bold text-warm-brown/60 w-8">
    <%= String.format("%.2f", percentage) %>%
</span>


</div>
</td>
</tr>

<%
}
%>



</tbody>
</table>
</div>
</section>

<%

   user_id = (Integer)session.getAttribute("userid");

 query = "select  amount, category, description, expense_date from expenses where user_id=? and expense_date >= TO_DATE(? || '-' || ? || '-01','YYYY-MM-DD') AND expense_date < ADD_MONTHS(TO_DATE(? || '-' || ? || '-01','YYYY-MM-DD'), 1)";

          stmt = con.prepareStatement(query);
            stmt.setInt(1,user_id);

                stmt.setInt(2, selectedYear);
                       stmt.setInt(3, selectedMonth);

                       stmt.setInt(4, selectedYear);
                       stmt.setInt(5, selectedMonth);

          rs = stmt.executeQuery();

%>


<!-- Detailed Expenses Table -->
<section class="lg:col-span-7 flex flex-col gap-4">
<div class="flex items-center justify-between">
<h2 class="text-warm-brown dark:text-slate-100 text-xl font-extrabold tracking-tight">Detailed Expenses</h2>
</div>
<div class="bg-white rounded-xl border shadow-sm overflow-hidden flex flex-col h-[460px]">
<div class="overflow-y-auto custom-scrollbar">
<table class="w-full text-left border-collapse min-w-[600px]">
<thead class="sticky top-0 z-10">
<tr>
<th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-warm-brown/60">Date</th>
<th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-warm-brown/60">Description</th>
<th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-warm-brown/60">Category</th>
<th class="px-6 py-4 text-xs font-bold uppercase tracking-wider text-warm-brown/60 text-right">Amount</th>
</tr>
</thead>
<tbody class="divide-y">

<%
while(rs.next())
{
%>

<tr class="transition-colors">
<td class="px-6 py-4 text-sm font-medium text-warm-brown/60"><%=rs.getDate(4)%></td>
<td class="px-6 py-4 text-sm font-bold"><%= rs.getString(3) %></td>
<td class="px-6 py-4">
<span class="inline-flex items-center rounded-full bg-emerald-100 px-2.5 py-0.5 text-xs font-bold text-emerald-800"><%=rs.getString(2)%></span>
</td>
<td class="px-6 py-4 text-right font-black text-sm text-warm-brown"><%=rs.getDouble(1)%></td>
</tr>



<%
}
%>

</tbody>
</table>
</div>

</div>
</div>
</section>
</div>
</main>
<!-- Minimal Footer -->
</div>
</body></html>



<%

                con.close();

        }catch(Exception e)
        {
            e.printStackTrace();
        }

 %>