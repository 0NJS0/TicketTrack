<?php

    function getConnection(){
        $con = mysqli_connect('127.0.0.1', 'root', '', 'tickettrack');
        return $con;
    }

    function login($username, $password){
        $con = getConnection();
        $sql = "select * from user where username='{$username}' and password='{$password}'";
        $result = mysqli_query($con, $sql);
        $count = mysqli_num_rows($result);

        if($count ==1){
            return true;
        }else{
            return false;
        }
    }

    function addUser($username, $full_name, $password, $email, $phone, $dob, $security_question, $security_answer,$type): bool {
        $con = getConnection();
        
        $sql = "INSERT INTO user VALUES ('', '{$username}', '{$full_name}', '{$email}', '{$phone}', '{$dob}', '{$password}','{$security_question}','{$security_answer}','{$type}')";
        
        if (mysqli_query($con, $sql)) {
            return true;
            }
        else {
            return false;
        }
    }

    

    function checkUserExists($email, $username)
{
    $con = getConnection();
    $sql = "SELECT * FROM user WHERE email ='{$email}' OR username = '{$username}'";
    $result = mysqli_query($con, $sql);
    $count = mysqli_num_rows($result);

        if($count >=1){
            return true;
        }else{
            return false;
        }
    }

    function getUser($name){
    $con = getConnection();
    $sql = "SELECT * FROM user WHERE username = '{$name}'";
    $result = mysqli_query($con, $sql);
    return mysqli_fetch_assoc($result);
    }

    function getAllUser() {
        $con = getConnection();
        $sql = "SELECT * FROM user";
        $result = mysqli_query($con, $sql);
        $users = [];
        while($row = mysqli_fetch_assoc($result)) {
            $users[] = $row;
        }
        return $users;
    }

    function getUserType($username) {
        $con = getConnection();
        $sql = "SELECT user_type FROM user WHERE username = '{$username}'";
        $result = mysqli_query($con, $sql);
    
        if ($result && mysqli_num_rows($result) > 0) {
            $row = mysqli_fetch_assoc($result);
            return $row['user_type']; // Returns the user type
        } else {
            return null; // No user found or error
        }
    }

    function checkSecurityQuestion($email, $security_question, $security_answer){
        $con = getConnection();

        $sql = "SELECT * FROM user WHERE email = '{$email}' AND security_question = '{$security_question}' AND security_answer = '{$security_answer}'";
        $result = mysqli_query($con, $sql);
        
        if (mysqli_num_rows($result) == 1) {
            return true;
        } else {
            return false;
        }
    }

    function recoverpassword($email, $new_password) {
        $con = getConnection();
        $sql = "UPDATE user SET password = '{$new_password}' WHERE email = '{$email}'";

        if (mysqli_query($con, $sql)) {
            return true;
            }
        else {
            return false;
        }
    }

    function getTotalUsers() {
        $con = getConnection();
    $sql = "SELECT * FROM user ";
    $result = mysqli_query($con, $sql);
    $count = mysqli_num_rows($result);

    return $count;

    }

    function getTotalTravellers() {
    $con = getConnection();
    $sql = "SELECT * FROM user WHERE user_type = 'traveller'";
    $result = mysqli_query($con, $sql);
    $count = mysqli_num_rows($result);

    return $count;

    }

    function getTotalAdmins() {
    $con = getConnection();
    $sql = "SELECT * FROM user WHERE user_type = 'admin'";
    $result = mysqli_query($con, $sql);
    $count = mysqli_num_rows($result);
    
    return $count;
    
    }

    function getTotalOperators() {
    $con = getConnection();
    $sql = "SELECT * FROM user WHERE user_type = 'operator'";
    $result = mysqli_query($con, $sql);
    $count = mysqli_num_rows($result);
        
    return $count;
        
    }
?>

