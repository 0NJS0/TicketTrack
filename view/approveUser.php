<?php
    session_start();
    require_once('../model/userModel.php');
    if(!isset($_COOKIE['status'])){
        header('location: login.html');  
    }

    $users = getWaitedUser();
?>


<html lang="en">
<head>
    <title>Userlist </title>
</head>
<body>
        <h2>User List</h2>    
        <a href="Admin_menu.php"> Back </a> | 
        <a href="../controller/logout.php"> logout </a>

        <br>

        <table border=1>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Date Of Birth</th>
                <th>User Type</th>
                <th>Action</th>
            </tr>
            <?php 
                for($i=0; $i<count($users); $i++){ 
            ?>
            <tr>
            <td><?php echo $users[$i]['id']; ?></td>
                <td><?php echo $users[$i]['username']; ?></td>
                <td><?=$users[$i]['fullname'] ?></td>
                <td><?=$users[$i]['email'] ?></td>
                <td><?=$users[$i]['phone'] ?></td>
                <td><?=$users[$i]['dob'] ?></td>
                <td><?=$users[$i]['user_type'] ?></td>
                <td>
                    <a href="../controller/approve.php?name=<?=$users[$i]['username']?>"> Approve </a> |
                    <a href="../controller/reject.php?name=<?=$users[$i]['username']?>"> Reject </a> 
                </td>  
            </tr>

            <?php } ?>
        </table>
</body>
</html>
