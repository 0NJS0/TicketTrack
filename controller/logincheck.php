<?php 
    session_start();
    require_once('../model/userModel.php');

    if(isset($_REQUEST['submit'])){
        $username = strtolower(trim($_REQUEST['username']));
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
                if(getapprovalstatus($username)) {
                header('location: ../view/Admin_menu.php');
                }
                else {
                    echo "Your not Approved by the admin yet";
                }
            }
                elseif($usertype == 'operator'){
                    if(getapprovalstatus($username)){
                    header('location: ../view/Operator_menu.php');
                    }
                    else{
                        echo "Your not Approved by the admin yet";
                    }
                }   
            }
        }
    }
    else{
        //echo "invalid request!";
        header('location: ../view/login.html');
    }

?>