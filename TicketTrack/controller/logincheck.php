<?php 
    session_start();
    require_once('../model/userModel.php');

    if(isset($_REQUEST['submit'])){
        $username = trim($_REQUEST['username']);
        $password = trim($_REQUEST['password']);

        if($username == null || empty($password)){
            echo "Null username/password";
        }else{
            
            $status = login($username, $password);
            if($status){
                $usertype= getUserType($username);
                setcookie('status', 'true', time()+3600, '/');
                $_SESSION['username'] = $username;
                $_SESSION['user_type']= $usertype;
                if($usertype == 'traveller'){
                header('location: ../view/Traveller_menu.php');
            }elseif($usertype == 'admin'){
                header('location: ../view/Admin_menu.php');
            }
                elseif($usertype == 'operator'){
                    header('location: ../view/Operator_menu.php');
                }   
            }
        }
    }
    else{
        //echo "invalid request!";
        header('location: ../view/login.html');
    }

?>