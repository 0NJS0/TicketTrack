<?php
    session_start();
    require_once('../model/userModel.php');
    if(!isset($_COOKIE['status'])){
        header('location: login.html');  
    }

    if(isset($_REQUEST['name'])){
        $name=$_REQUEST['name'];
        $user=getUser($name);
        $_SESSION['current_name']=$name;
    }
    
?>

<html>
<head>
    <title>Edit Page</title>
</head>
<body>
    <h2>Edit User</h2>
    <form method="post" action="../controller/updateCheck.php" enctype=""> 
        <table border="1" cellspacing="0" cellpadding="10">
            <tr>
                <th colspan="2">Edit User Details</th>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="username_update" value="<?=$user['username']?>" /></td>
            </tr>
            <tr>
                <td>Full Name:</td>
                <td><input type="text" name="fullname_update" value="<?=$user['fullname']?>" /></td>
            </tr>
            <tr>
                <td>Phone Number:</td>
                <td><input type="text" name="phone_update" value="<?=$user['phone']?>" /></td>
            </tr>
            <tr>
                <td>Date Of Birth:</td>
                <td><input type="text" name="dob_update" value="<?=$user['dob']?>" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="update" value="Update" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>