<?php
    session_start();
    require_once('../model/notificationModel.php');
    if(!isset($_COOKIE['status'])){
        header('location: login.html');  
    }

    if (isset($_REQUEST['id'])) {
        $data = json_decode($_REQUEST['id'], true);
        $username = $_SESSION['username']; 
        $notification_id= $data['id'];

        $status = markNotificationAsRead($notification_id, $username);
    
        if ($status) {
            $response =(['success' => true, 'message' => 'Notification marked as read']);
        } else {
            $response =(['success' => false, 'message' => 'Failed to mark notification as read']);
        }
        
        echo json_encode($response);
        exit;

    } else {
        $response =(['success' => false, 'message' => 'No notification ID provided']);
        echo json_encode($response);
    }

?>