<?php
    session_start();
    require_once('../model/userModel.php');
    if(!isset($_COOKIE['status'])){
        header('location: login.html');  
    }

    if(isset($_REQUEST['name'])){
        $name=$_REQUEST['name'];

        $status=deleteUser($name);
        if($status){
            header('location: ../view/userlist.php');
        }else{
            echo 'Failled To delete user';
        }
    }

    else{
        header('location: ../view/userlist.php');
    }

?>