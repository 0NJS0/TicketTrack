<?php
session_start();
require_once('../model/notificationModel.php');

if (!isset($_COOKIE['status'])) {
    header('location: login.html');
    exit();

    
}

    $username = $_SESSION['username'];
    $notifications = getAllNotifications($username);

?>

<head>
    <title>All Notifications</title>
</head>
<body>
    <h2>Notification List</h2>    
    <a href="./Admin_menu.php"> Back </a>
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
