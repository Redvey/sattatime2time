<?php
require("connection.php");

	$username=$_POST["username"];
	$mobile=$_POST["mobile"];
	$email=$_POST["email"];
	$password=$_POST["password"];
	date_default_timezone_set('Asia/Kolkata');
    $date=date('Y-m-d');



  $checkUser="SELECT * from user WHERE mobile='$mobile'";
  $checkQuery=mysqli_query($con,$checkUser);
  $rowcount=mysqli_num_rows($checkQuery);

  if($rowcount<=0)
  {

         $insertQuery="INSERT INTO `user`(`id`, `username`, `mobile`, `email`, `password`, `register_date`) VALUES ('','$username','$mobile','$email','$password','$date')";
        $result=mysqli_query($con,$insertQuery);
            if($result)
            {
                $response="Registration Successful";
            }
            else
            {
               $response="Registeration failed!";
            }



  }
    else
    {
          $response['message']="User already exist";
    }

 	echo json_encode($response);
?>