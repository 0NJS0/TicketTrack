<?php
session_start();
require_once('../model/notificationModel.php');
require_once('../model/userModel.php');

if (!isset($_COOKIE['status'])) {
    header('location: login.html');
    exit();

    
}

    $username = $_SESSION['username'];
    $notifications = getAllNotifications($username);
    $usertype=getUserType($username);
?>

<head>
    <title>All Notifications</title>
</head>
<body>
    <h2>Notification List</h2>    
    <?php if ($usertype == 'admin') { ?>
        <a href="./Admin_menu.php"> Back </a>
    <?php } elseif ($usertype == 'operator') { ?>
        <a href="./Operator_menu.php"> Back </a>
    <?php } elseif ($usertype == 'traveller') { ?>
        <a href="./Traveller_menu.php"> Back </a>
    <?php } ?>
    <a href="../controller/logout.php"> Logout </a>
    <br><br>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Message</th>
            <th>Type</th>
            <th>status</th>
            <th>Time</th>
            <th>Action</th>
        </tr>
        <?php
            for ($i = 0; $i < count($notifications); $i++) { 
        ?>
        <tr>
            <td><?php echo $notifications[$i]['id']; ?></td>
            <td><?php echo $notifications[$i]['message']; ?></td>
            <td><?php echo $notifications[$i]['type']; ?></td>
            <td><?php echo $notifications[$i]['status']; ?></td>
            <td><?php echo $notifications[$i]['time']; ?></td>
            <td>
            <a href="../controller/deleteNotifications.php?id=<?php echo $notifications[$i]['id']; ?>">Delete</a>
            </td>
        </tr>
        <?php } ?>
        <tr>
            <td colspan="6" align="center"><a href="./unreadNotifications.php"> Unread Notifications </a>  </td>
        </tr>
    </table>
</body>
</html>
