<html>
<body>

<h3>Add you Expense </h3>
<br>

<form action = 'controller'>
<input type ='hidden' name ='action' value = 'add'>

Amount : <input type = number name = 'amount'>
<br><br>

Category : <input type = text name = 'category' >
<br><br>

Description :  <textarea id="description"
                      name="description"
                       rows="5"
                       cols="40"
                       placeholder="Write your description here...">
               </textarea>
<br><br>

Expense Date : <input type = date name = 'date'>
<br><br>

<input type = submit  >


</form>
</body>
</html>