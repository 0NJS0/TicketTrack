<?php
session_start();
require_once('../model/userModel.php');

if (isset($_POST['loginData'])) {
    $data = json_decode($_POST['loginData'], true);
    $username = strtolower(trim($data['username']));
    $password = trim($data['password']);
    $response = [];

    if ($username === "" || $password === "") {
        $response['success'] = false;
        $response['message'] = "Username and password are required!";
        echo json_encode($response);
        exit();
    }


    $status = login($username, $password);

    if ($status) {
        $usertype = getUserType($username);

        if (($usertype === 'admin' || $usertype === 'operator') && !getapprovalstatus($username)) {
            $response['success'] = false;
            $response['message'] = "You are not approved by the admin yet.";
            echo json_encode($response);
            exit();
        }

 
        $response['success'] = true;
        $response['message'] = "Login successful!";
        $response['usertype'] = $usertype;

        $_SESSION['username'] = $username;
        $_SESSION['user_type'] = $usertype;
        setcookie('status', 'true', time() + 3600, '/');
    } else {
        $response['success'] = false;
        $response['message'] = "Invalid username or password.";
    }

    echo json_encode($response);
    exit();
} else {
    header('Location: ../view/login.html');
    exit();
}

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
        else{
            echo "User Not Registered";

        }
    }
}
else{

    header('location: ../view/login.html');
}
?>
