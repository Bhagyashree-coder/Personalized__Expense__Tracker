<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>SpendWise - Choose Action</title>
<!-- Tailwind CSS v3 CDN -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            brandPrimary: '#6366f1',
            brandSecondary: '#a855f7',
            brandTeal: '#0d9488',
          },
          backgroundImage: {
            'main-gradient': 'linear-gradient(135deg, #f5f3ff 0%, #fae8ff 100%)',
            'button-gradient': 'linear-gradient(90deg, #6366f1 0%, #a855f7 100%)',
            'teal-gradient': 'linear-gradient(90deg, #14b8a6 0%, #0d9488 100%)',
          }
        }
      }
    }
  </script>
<style data-purpose="custom-animations">
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(10px); }
      to { opacity: 1; transform: translateY(0); }
    }
    .animate-fade-in {
      animation: fadeIn 0.5s ease-out forwards;
    }
    .delay-1 { animation-delay: 0.1s; }
    .delay-2 { animation-delay: 0.2s; }
    .delay-3 { animation-delay: 0.3s; }
  </style>
</head>
<body class="bg-main-gradient min-h-screen flex items-center justify-center p-6 font-sans antialiased text-slate-800">
<!-- BEGIN: MainContainer -->
<main class="w-full max-w-md bg-white/80 backdrop-blur-md rounded-[2.5rem] shadow-2xl p-8 border border-white/50" data-purpose="action-selection-card">
<!-- BEGIN: HeaderSection -->
<header class="text-center mb-10">
<h1 class="text-3xl font-extrabold tracking-tight text-slate-900 mb-4 leading-tight">
        How do you want to <span class="text-transparent bg-clip-text bg-gradient-to-r from-brandPrimary to-brandSecondary">track your Expense?</span>
</h1>
<p class="text-slate-500 text-sm">Select an action below to manage your finances</p>
</header>
<!-- END: HeaderSection -->
<!-- BEGIN: ActionButtons -->
<section class="flex flex-col gap-5" data-purpose="navigation-actions">
<!-- ACTION: ADD EXPENSE URL GOES HERE -->
<!-- REPLACE # WITH YOUR URL HERE (e.g., /add-expense) --><a class="group relative overflow-hidden bg-teal-gradient p-5 rounded-2xl shadow-lg shadow-teal-200/50 flex items-center justify-between transition-all duration-300 hover:scale-[1.02] active:scale-95 animate-fade-in delay-1" data-purpose="btn-add-expense" href="Bootstrap_add_expense.jsp">
<div class="flex items-center gap-4">
<div class="bg-white/20 p-3 rounded-xl">
<svg class="h-6 w-6 text-white" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
<path d="M12 4v16m8-8H4" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
</svg>
</div>
<span class="text-xl font-bold text-white">Add Expense</span>
</div>
<svg class="h-5 w-5 text-white/70 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
<path d="M9 5l7 7-7 7" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
</svg>
</a>
<!-- ACTION: VIEW EXPENSE URL GOES HERE -->
<!-- REPLACE # WITH YOUR URL HERE (e.g., /view-expenses) --><a class="group relative overflow-hidden bg-button-gradient p-5 rounded-2xl shadow-lg shadow-indigo-200/50 flex items-center justify-between transition-all duration-300 hover:scale-[1.02] active:scale-95 animate-fade-in delay-2" data-purpose="btn-view-expense" href='bootstrap_view_expenses'>
<div class="flex items-center gap-4">
<div class="bg-white/20 p-3 rounded-xl">
<svg class="h-6 w-6 text-white" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
<path d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
<path d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
</svg>
</div>
<span class="text-xl font-bold text-white">View Expense</span>
</div>
<svg class="h-5 w-5 text-white/70 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
<path d="M9 5l7 7-7 7" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
</svg>
</a>
<!-- ACTION: EXPENSE SUMMARY URL GOES HERE -->
<!-- REPLACE # WITH YOUR URL HERE (e.g., /expense-summary) --><a class="group relative overflow-hidden bg-slate-800 p-5 rounded-2xl shadow-lg shadow-slate-200/50 flex items-center justify-between transition-all duration-300 hover:scale-[1.02] active:scale-95 animate-fade-in delay-3 bg-blue-900 shadow-blue-200/50" data-purpose="btn-expense-summary" href='Bootstrap_Summary.jsp'>
<div class="flex items-center gap-4">
<div class="bg-white/10 p-3 rounded-xl">
<svg class="h-6 w-6 text-white" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
<path d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
</svg>
</div>
<span class="text-xl font-bold text-white">Expense Summary</span>
</div>
<svg class="h-5 w-5 text-white/70 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
<path d="M9 5l7 7-7 7" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
</svg>
</a>
</section>
<!-- END: ActionButtons -->
<!-- BEGIN: Footer -->
<!-- END: Footer -->
</main>
<!-- END: MainContainer -->
</body></html>