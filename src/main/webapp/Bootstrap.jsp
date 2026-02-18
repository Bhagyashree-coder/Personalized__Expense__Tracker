<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body bgcolor="red">
<h3 align=center> Welcome to Sign Up Page......!! </h2>


<div class="container mt-3">

  <form action="login_verification">
  <input type ='hidden' name ='action' value = 'signup'>

     <div class="mb-3">
          <label for="name"> <b>Username : </b></label>
          <input type="name" class="form-control" id="name" placeholder="Enter username" name="name">
        </div>

    <div class="mb-3">
      <label for="pwd"><b> Password : </b></label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pass">
    </div>
     <div class="mb-3 mt-3">
          <label for="email"><b> Email : </b></label>
          <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
        </div>

    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>

</body>
</html>
