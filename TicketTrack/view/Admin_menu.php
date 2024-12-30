<?php
    session_start();
    require_once('../model/userModel.php');
    if(!isset($_COOKIE['status'])){
        header('location: login.html');  
    }
    $totalUsers = getTotalUsers();
    $totalTraveller= getTotalTravellers();
    $totalAdmin= getTotalAdmins();
    $totalOperator= getTotalOperators()
?>

<html lang="en">
<head>
    <title>Home</title>
    </head>
<body>
    <h1>Welcome Admin! <?=$_SESSION['username']?></h1> 


    <h2>Dashboard</h2>
    <table border="1" cellspacing="0" cellpadding="10">
        <tr>
            <th colspan="2">Dashboard Statistics</th>
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
    </table>

    <hr>


    <h2>Admin Actions</h2>
    <table border="1" cellspacing="0" cellpadding="10">
        <tr>
            <th colspan="2">Actions</th>
        </tr>
        <tr>
            <td><a href="userlist.php">View All Users</a></td>
            <td><a href="../controller/logout.php">Logout</a></td>
        </tr>
    </table>

</body>
</html>