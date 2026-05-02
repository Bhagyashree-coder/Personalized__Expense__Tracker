<!DOCTYPE html>

<html class="light" lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Add Expense - ExpenseTracker</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:wght@300;400;500;600;700&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#ec5b13",
                        "background-light": "#f8f6f6",
                        "background-dark": "#221610",
                        "soft-pink": "#fce7f3",
                        "accent-pink": "#f472b6",
                    },
                    fontFamily: {
                        "display": ["Public Sans", "sans-serif"]
                    },
                    borderRadius: {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "full": "9999px"
                    },
                },
            },
        }
    </script>
<style>
        body {
            font-family: 'Public Sans', sans-serif;
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        .bg-gradient-custom {
            background: linear-gradient(135deg, #fff1f2 0%, #fae8ff 50%, #f5f3ff 100%);
        }
    </style>
</head>
<body class="bg-gradient-custom min-h-screen font-display text-slate-900">
<div class="layout-container flex h-full grow flex-col">
<!-- Top Navigation -->
<main class="flex-1 flex flex-col items-center justify-center p-6 lg:p-12">
<div class="w-full max-w-2xl">
<!-- Header Section -->
<div class="text-center mb-8">
<h1 class="text-4xl font-extrabold text-slate-900 tracking-tight mb-2">Add New Expense</h1>
<p class="text-slate-500 font-medium">Keep your budget on track with a quick entry.</p>
</div>



<!-- Main Form Card (Glassmorphism) -->

<div class="glass-card rounded-xl shadow-2xl p-8 lg:p-10">

<%
String expense = (String) session.getAttribute("expense");
if ("true".equals(expense)) {
%>

<div style="text-align: right;">
<button type="button" onclick="window.location.href='Bootstrap_add_expense.jsp'" style="display: inline-flex; align-items: center; gap: 0.5rem; background-color: #ec4899; color: white; border: none; padding: 0.75rem 1.5rem; border-radius: 12px; font-weight: 600; font-size: 0.9rem; transition: opacity 0.2s; font-family: sans-serif; cursor: pointer;">
  <span style="font-size: 1.2rem; line-height: 1;">+</span> Add Another Expense
</button>
</div>
<%
}
%>

<form action='controller' class="space-y-8" >

 <input type ='hidden' name ='action' value = 'add'>

<!-- REPLACE '#' WITH YOUR BACKEND ACTION URL HERE -->



<%

if ("true".equals(expense)) {


%>

       <b> Expense added successfully!</b>
        <br>

<%
session.removeAttribute("expense");
}
%>








<!-- Amount Field -->


<div class="flex flex-col gap-2">
<label class="text-sm font-bold uppercase tracking-wider text-slate-500 ml-1" for="amount">Amount</label>
<div class="relative">

<%
if ("true".equals(expense)){
Double amount = Double.parseDouble(request.getParameter("amount"));

%>
<input class="w-full pr-4 py-5 bg-white/50 border border-slate-200 rounded-xl text-3xl font-bold text-slate-900 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all placeholder:text-slate-300 px-4" id="amount" name="amount" value=<%= amount %> placeholder="0.00" required="" step="0.01" type="number"/>
<%
session.removeAttribute("expense");}else
{
%>
<input class="w-full pr-4 py-5 bg-white/50 border border-slate-200 rounded-xl text-3xl font-bold text-slate-900 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all placeholder:text-slate-300 px-4" id="amount" name="amount"  placeholder="0.00" required="" step="0.01" type="number"/>
<%
}
%>

</div>
</div>

<!-- Category Selection -->

<div class="flex flex-col gap-4"><label class="text-sm font-bold uppercase tracking-wider text-slate-500 ml-1" for="category">Category</label>
<%
if ("true".equals(expense)){

String category = request.getParameter("category");

%>
<input class="w-full px-4 py-3 bg-white/50 border border-slate-200 rounded-xl text-slate-900 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all placeholder:text-slate-400" id="category" value = <%= category %> name="category" placeholder="e.g., Food, Travel, Rent" required="" type="text"/></div>
<%
session.removeAttribute("expense");}else
{
%>
<input class="w-full px-4 py-3 bg-white/50 border border-slate-200 rounded-xl text-slate-900 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all placeholder:text-slate-400" id="category" name="category" placeholder="e.g., Food, Travel, Rent" required="" type="text"/></div>
<%
}
%>

<!-- Date and Description -->

<div class="grid grid-cols-1 md:grid-cols-2 gap-6">
<div class="flex flex-col gap-2">
<label class="text-sm font-bold uppercase tracking-wider text-slate-500 ml-1" for="date">Date</label>

<%
if ("true".equals(expense)){

String date = request.getParameter("date");
%>
<input class="w-full px-4 py-3 bg-white/50 border border-slate-200 rounded-xl text-slate-900 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all" id="date" value = <%= date %> name="date" required="" type="date"/>
<%
session.removeAttribute("expense");}else
{
%>
<input class="w-full px-4 py-3 bg-white/50 border border-slate-200 rounded-xl text-slate-900 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all" id="date" name="date" required="" type="date"/>
<%
}
%>

</div>

<div class="flex flex-col gap-2">
<label class="text-sm font-bold uppercase tracking-wider text-slate-500 ml-1" for="description">Description</label>
<%
if ("true".equals(expense)){

String description = request.getParameter("description");

%>
<textarea class="w-full px-4 py-3 bg-white/50 border border-slate-200 rounded-xl text-slate-900 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all placeholder:text-slate-400" id="description" name="description" placeholder="What was this for?" rows="3"><%= description %></textarea>
<%
session.removeAttribute("expense");}else
{
%>
<textarea class="w-full px-4 py-3 bg-white/50 border border-slate-200 rounded-xl text-slate-900 focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all placeholder:text-slate-400" id="description" name="description" placeholder="What was this for?" rows="3"></textarea>
<%
}
%>

</div>
</div>

<!-- Submit Button -->
<div class="pt-4">
<button class="w-full py-4 px-6 bg-pink-100 hover:bg-pink-200 text-pink-700 font-bold text-lg rounded-xl transition-all shadow-sm active:scale-[0.98] border border-pink-200 flex items-center justify-center gap-2" type="submit">
<span class="material-symbols-outlined">check_circle</span>
                                Save Expense
                            </button>
                            <br>

<div style='text-align: center; margin-bottom: 2rem;'>
  <a href='Bootstrap_dashboard.jsp' style='display: inline-flex; align-items: center; gap: 0.5rem; text-decoration: none; background: #eef2ff; color: #6366f1; padding: 0.6rem 1.2rem; border-radius: 8px; font-weight: 600; font-size: 0.9rem; transition: background 0.2s; font-family: sans-serif;'>
   <span>&larr;</span> Back to Dashboard
  </a>
</div>






</div>
</form>
</div>
<!-- Footer/Help Link -->
</div>
</main>
</div>
</body></html>