<?php
    session_start();
    require_once('../model/notificationModel.php');
    if(!isset($_COOKIE['status'])){
        header('location: login.html');  
    }

    if(isset($_REQUEST['id'])){
        $username = $_SESSION['username'];
        $notification_id=$_REQUEST['id'];

        $status= markNotificationAsRead($notification_id, $username);
        if($status){
            header('location: ../view/UnreadNotifications.php');
        }else{
            echo 'Failed To Read Notification';
        }
    }

    else{
        header('location: ../view/unreadNotifications.php');
    }

?>