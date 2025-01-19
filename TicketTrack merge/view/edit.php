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
        <link rel="stylesheet" href="../asset/css/edit.css">
        <script src="../asset/javascript/edit.js" defer></script>
    </head>
    <body>
    <h1>Edit User</h1>
    <div class="signup-container">
        <div class="back-link">
            <a href="./userlist.php">Back </a>
        </div>
        <form method="post" onsubmit="return validForm()" action="../controller/updateCheck.php" >
            <table>
                <tr>
                    <th colspan="2">Edit User Details</th>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" id="username" name="username_update" value="<?= $user['username'] ?> " readonly/></td>
                </tr>
                <tr>
                    <td>Full Name:</td>
                    <td><input type="text" id="fullname" name="fullname_update" value="<?= $user['fullname'] ?>" /></td>
                </tr>
                <tr>
                    <td>Phone Number:</td>
                    <td><input type="text" id="phone" name="phone_update" value="<?= $user['phone'] ?>" /></td>
                </tr>
                <tr>
                    <td>Date Of Birth:</td>
                    <td><input type="date" id="dob" name="dob_update" value="<?= $user['dob'] ?>" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="update" value="Update" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>