<?php
    session_start();
    if(!isset($_COOKIE['status'])){
        header('location: login.html');  
    }
?>


<html lang="en">
<head>
    <title>Home</title>
</head>
<body>
        <h1>Welcome Home! <?=$_SESSION['username']?></h1>    


        <h2>Admin Actions</h2>
    <table border="1" cellspacing="0" cellpadding="10">
        <tr>
            <th colspan="6">Actions</th>
        </tr>
        <tr>
            <td><a href="viewfaq.php">FAQ</a></td>
            <td><a href="unreadNotifications.php">Notifications</a></td>
            <td><a href="../controller/logout.php">Logout</a></td>
        </tr>
    </table>
</body>
</html>
