<?php
    session_start();
    require_once('../model/userModel.php');
    if(!isset($_COOKIE['status'])){
        header('location: login.html');  
    }

    if(isset($_REQUEST['name'])){
        $name=$_REQUEST['name'];

        $status=approveUser($name);
        if($status){
            header('location: ../view/approveUser.php');
        }else{
            echo 'Failed To Approve the user';
        }
    }

    else{
        header('location: ../view/approveUser.php');
    }

?>