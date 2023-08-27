<?php
error_reporting(1);
session_start();
include("dbcon.php");
if(isset($_SESSION['user_session'])){
  
  $invoice_number="CA-".invoice_number();
	header("location:home.php?invoice_number=$invoice_number");
}
   if(isset($_POST['submit'])){  //******Login Form*******
  $username =$_POST['username'];

  $password = $_POST['password'];

  $password = sha1($password);

  $select_sql = "SELECT * FROM users ";

  $select_query = mysqli_query($con,$select_sql);
   
  if($select_query){

  	while ($row =mysqli_fetch_array($select_query)) {
  		$s_username = $row['user_name'];
  		$s_password = $row['password'];
  	}
  }

 if($s_username == $username && $s_password == $password){
          
         $_SESSION['user_session'] = $s_username;
         $invoice_number="CA-".invoice_number();
 	       header("location:home.php?invoice_number=$invoice_number");


 }else{
 	  	    $error_msg = "<center><font color='orange'><b>Login Failed</b></font></center>";
 }

}                  //******Login Form*******

  function invoice_number(){   //********Outputting Random Number For Invoice Number********

    $chars = "09302909209300923";
    srand((double)microtime()*1000000);
    $i = 1;
    $pass = '';
    while($i <=7){

      $num  = rand()%10;
      $tmp  = substr($chars, $num,1);
      $pass = $pass.$tmp;
      $i++;
    }
    return $pass;
                        //********Outputting Random Number For Invoice Number********
  }                       
?>

<!DOCTYPE html>
<html>
<!DOCTYPE html>
<html>
<head>

	<title>PMS</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="css/bootstrap-responsive.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <style type="text/css">
       body{
        background-image:url(images/phar.jpg);
        background-size: cover;
    
    }

    .glass-box {
    width: 450px;
    height: 330px;
    background: radial-gradient(rgba(100, 100, 100, 0.6));
    box-shadow: 0 0 20px rgba(25, 5, 5, 0.6);
    border-radius: 30px;
    backdrop-filter: blur(5px);
}
.container{
  margin:center;
  padding:20px;
  text-align: center;
}
</style>
</head>
<body >

	<center>
		<br><br><font face="Cascadia Code SemiBold"> <h1>Pharmacy Management System</h1></font>
	</center>
<br>
	<div class="content" style="width: 450px">
  <div class="glass-box" >
		<form method="POST">
    <div class="container">
		<table border="3" bordercolor="orange" width="400" cellspacing="4" cellpadding="7">
      <br><br><br>
			<tr>
			  <td><label for="username"><h5>Username</h5></label></td>
			  <td><center><input type="text" autocomplete="off" name="username" class="form-group" required></center></td>
			</tr>
			<tr>
				<td><label for="password"><h5>Password</h5></label></td><br>
				<td><center><input type="password" name="password" required></center></td>
			</tr>
      <input type="hidden" aucomplete="off" name="invoice_number" value="<?php echo 'CA-'.invoice_number()?>">
		</table>
    </div>
    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit" name="submit" class="btn btn-success btn-large" value="login">

    <?php echo $error_msg;?>
  </div>
	</form>
  </div> 
</body>
</html>