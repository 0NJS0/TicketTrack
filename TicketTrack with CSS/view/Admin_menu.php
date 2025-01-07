<?php
    session_start();
    require_once('../model/userModel.php');
    require_once('../model/notificationModel.php');
    if(!isset($_COOKIE['status'])){
        header('location: login.html');  
    }
    $username=$_SESSION['username'];
    $totalUsers = getTotalUsers();
    $totalTraveller= getTotalTravellers();
    $totalAdmin= getTotalAdmins();
    $totalOperator= getTotalOperators();
    $totalAwaitedUsers=getTotalUnapprovedUsers();
    $totalnotifications=getTotalUnreadNotifications($username);
?>

<html lang="en">
<head>
    <title>Home</title>
    </head>
<body>
    <h1>Welcome <?=$username?></h1> 


    <table border="1" cellspacing="0" cellpadding="10">
        <tr>
            <th colspan="2">Dashboard</th>
        </tr>
        <tr>
            <td>Total Users</td>
            <td><?php echo $totalUsers; ?> users</td>
        </tr>
        <tr>
            <td>Total Number Of Admin</td>
            <td><?php echo $totalAdmin; ?> Admin</td>
        </tr>
        <tr>
            <td>Total Number Of Operator</td>
            <td><?php echo $totalOperator; ?> Operator</td>
        </tr>
        <tr>
            <td>Total Number Of Traveller</td>
            <td><?php echo $totalTraveller; ?> Traveller</td>
        </tr>
        <tr>
            <td>Users Wating for Approval</td>
            <td><a href="approveUser.php"><?php echo $totalAwaitedUsers; ?></a> Users</td>
        </tr>
        <tr>
            <td>Total Unread Notifications</td>
            <td><a href="unreadNotifications.php"><?php echo $totalnotifications; ?></a></td>
        </tr>
    </table>




    <h2>Admin Actions</h2>
    <table border="1" cellspacing="0" cellpadding="10">
        <tr>
            <th colspan="6">Actions</th>
        </tr>
        <tr>
            <td><a href="userlist.php">View All Users</a></td>
            <td><a href="approveUser.php">Approve Users</a></td>
            <td><a href="insertfaq.php">Insert FAQ</a></td>
            <td><a href="offers.php">Insert Promotional Offers</a></td>
            <td><a href="unreadNotifications.php">Notifications</a></td>
            <td><a href="../controller/logout.php">Logout</a></td>
        </tr>
    </table>

</body>
</html>