<!DOCTYPE html>

<html lang="en"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>SpendWise - Login</title>
<!-- Tailwind CSS v3 CDN -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            'brand-purple': '#6366f1',
            'brand-pink': '#d946ef',
          },
          backgroundImage: {
            'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
          }
        }
      }
    }
  </script>
<style data-purpose="custom-gradients">
    /* Custom background gradient to match the soft purple/white aesthetic */
    body {
      background: radial-gradient(circle at top left, #f3e8ff 0%, #ffffff 40%, #fae8ff 100%);
      min-height: 100vh;
    }
    /* Primary Action Button Gradient */
    .btn-gradient {
      background: linear-gradient(90deg, #6366f1 0%, #d946ef 100%);
      transition: opacity 0.2s ease-in-out;
    }
    .btn-gradient:hover {
      opacity: 0.9;
    }
    /* Icon Container Gradient */
    .icon-bg {
      background: linear-gradient(135deg, #a855f7 0%, #ec4899 100%);
    }
  </style>
<style data-purpose="typography">
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Lora:wght@500&display=swap');

    body {
      font-family: 'Inter', sans-serif;
    }
    .brand-title {
      font-family: 'Lora', serif;
    }
  </style>
</head>
<body class="flex flex-col items-center justify-center p-4 min-h-screen">
<!-- BEGIN: MainHeader -->
<header class="flex flex-col items-center mb-8" data-purpose="branding-header">
<!-- App Icon -->
<!-- Title and Slogan -->
<div class="text-center relative">
<h1 class="brand-title text-slate-800 tracking-tight flex items-center justify-center text-3xl md:text-4xl font-bold">Welcome to Your <span class="block md:inline ml-1">personalized <span class="bg-gradient-to-r from-brand-purple to-brand-pink bg-clip-text text-transparent font-extrabold">Expense Tracker</span></span></h1>
<p class="text-slate-500 mt-2 text-lg">Track every expense, master your money</p>
</div>
</header>
<!-- END: MainHeader -->
<!-- BEGIN: AuthContainer -->
<main class="w-full max-w-md" data-purpose="auth-form-container">
<div class="bg-white rounded-[2rem] shadow-xl shadow-indigo-100/50 p-8 md:p-10 border border-white">
<!-- Welcome Text -->
<!-- Toggle Tabs -->
<p class="text-center text-xs font-medium text-slate-400 mb-3 uppercase tracking-wider">Choose one option</p><div class="flex p-1 bg-slate-100 rounded-xl mb-8" data-purpose="form-toggle">
<button class="flex-1 py-2.5 text-sm font-semibold rounded-lg bg-indigo-600 text-white shadow-sm transition-all duration-200" id="btn-toggle-login" type="button">
          Login
        </button>
<button class="flex-1 py-2.5 text-sm font-semibold text-slate-500 rounded-lg transition-all duration-200" id="btn-toggle-signup" type="button">
          Sign Up
        </button>
</div>
<!-- Login Form -->
<form action="/login" class="space-y-6" id="auth-form" method="POST">
<input type ='hidden' name ='action' value = 'login'>

<!-- Email Field -->
<div data-purpose="form-group" id="username-group">
<label class="flex items-center text-sm font-medium text-slate-700 mb-2" for="username">
<svg class="h-4 w-4 mr-2 text-indigo-500" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
<path d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
</svg>
            Username
          </label>
<input class="w-full px-4 py-3 bg-slate-50 border-none rounded-xl text-slate-800 placeholder:text-slate-400 focus:ring-2 focus:ring-indigo-500 focus:bg-white transition-all" id="username" name="username" placeholder="Enter username." required="" type="text"/>
</div><div class="hidden" data-purpose="form-group" id="email-group">
<label class="flex items-center text-sm font-medium text-slate-700 mb-2" for="email">
<svg class="h-4 w-4 mr-2 text-indigo-500" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
<path d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
</svg>
            Email
          </label>
<input class="w-full px-4 py-3 bg-slate-50 border-none rounded-xl text-slate-800 placeholder:text-slate-400 focus:ring-2 focus:ring-indigo-500 focus:bg-white transition-all" id="email" name="email" placeholder="you@example.com" required="" type="email"/>
</div>
<!-- Password Field -->
<div data-purpose="form-group">
<label class="flex items-center text-sm font-medium text-slate-700 mb-2" for="password">
<svg class="h-4 w-4 mr-2 text-indigo-500" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
<path d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
</svg>
            Password
          </label>
<input class="w-full px-4 py-3 bg-slate-50 border-none rounded-xl text-slate-800 placeholder:text-slate-400 focus:ring-2 focus:ring-indigo-500 focus:bg-white transition-all" id="password" name="password" placeholder="Enter password." required="" type="password"/>
</div>
<!-- Submit Button -->
<!-- The formaction below is dynamically updated by the script at the bottom of the page based on the toggle selection --><button class="btn-gradient w-full py-4 rounded-xl text-white font-bold flex items-center justify-center gap-2 shadow-lg shadow-indigo-200 mt-4 group" type="submit">
<span id="submit-text">Log In</span>
<svg class="h-5 w-5 group-hover:translate-x-1 transition-transform" fill="none" stroke="currentColor" viewbox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
<path d="M14 5l7 7m0 0l-7 7m7-7H3" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
</svg>
</button>
</form>
</div>
</main>
<!-- END: AuthContainer -->
<!-- BEGIN: Footer -->
<!-- END: Footer -->
<!-- BEGIN: ClientScripts -->
<script data-purpose="form-interaction">
    const loginBtn = document.getElementById('btn-toggle-login');
    const signupBtn = document.getElementById('btn-toggle-signup');
    const submitText = document.getElementById('submit-text');
    const authForm = document.getElementById('auth-form');
    const emailGroup = document.getElementById('email-group');
    const emailInput = document.getElementById('email');

    /**
     * Configuration: Change these URLs to point to your backend endpoints.
     */
    const ACTION_URLS = {
      LOGIN: 'login_verification',
      SIGNUP: 'Bootstrap_dashboard.jsp'
    };

    function switchToLogin() {
      // 1. Update UI Toggle Buttons
      loginBtn.classList.add('bg-indigo-600', 'text-white', 'shadow-sm');
      loginBtn.classList.remove('text-slate-500');
      signupBtn.classList.add('text-slate-500');
      signupBtn.classList.remove('bg-indigo-600', 'text-white', 'shadow-sm');

      // 2. Hide Email Field
      emailGroup.classList.add('hidden');
      emailInput.required = false;

      // 3. Update Submit Button & Form Action
      submitText.textContent = 'Log In';
      authForm.action = ACTION_URLS.LOGIN;
    }

    function switchToSignup() {
      // 1. Update UI Toggle Buttons
      signupBtn.classList.add('bg-indigo-600', 'text-white', 'shadow-sm');
      signupBtn.classList.remove('text-slate-500');
      loginBtn.classList.add('text-slate-500');
      loginBtn.classList.remove('bg-indigo-600', 'text-white', 'shadow-sm');

      // 2. Show Email Field
      emailGroup.classList.remove('hidden');
      emailInput.required = true;

      // 3. Update Submit Button & Form Action
      submitText.textContent = 'Sign Up';
      authForm.action = ACTION_URLS.SIGNUP;
    }

    loginBtn.addEventListener('click', switchToLogin);
    signupBtn.addEventListener('click', switchToSignup);

    // Initialize the form state as 'Login'
    switchToLogin();
  </script>
<!-- END: ClientScripts -->
</body></html>