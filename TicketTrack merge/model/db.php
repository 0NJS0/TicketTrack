<?php


function getConnection() {
    $con = mysqli_connect('127.0.0.1', 'root', '', 'tickettrack');
    return $con;
}
// function login($username, $password){
//     $con = getConnection();
//     $sql = "select * from user where username='{$username}' and password='{$password}'";
//     $result = mysqli_query($con, $sql);
//     $count = mysqli_num_rows($result);

//     if($count ==1){
//         return true;
//     }else{
//         return false;
//     }
// }
// function addUser($username, $full_name, $password, $email, $phone, $dob, $security_question, $security_answer,$type,$approval): bool {
//     $con = getConnection();
    
//     $sql = "INSERT INTO user VALUES ('', '{$username}', '{$full_name}', '{$email}', '{$phone}', '{$dob}', '{$password}','{$security_question}','{$security_answer}','{$type}','{$approval}')";
    
//     if (mysqli_query($con, $sql)) {
//         return true;
//         }
//     else {
//         return false;
//     }
// }
// function checkUserExists($email, $username)
// {
// $con = getConnection();
// $sql = "SELECT * FROM user WHERE email ='{$email}' OR username = '{$username}'";
// $result = mysqli_query($con, $sql);
// $count = mysqli_num_rows($result);

//     if($count >=1){
//         return true;
//     }else{
//         return false;
//     }
// }
// function checkSecurityQuestion($email, $security_question, $security_answer){
//     $con = getConnection();

//     $sql = "SELECT * FROM user WHERE email = '{$email}' AND security_question = '{$security_question}' AND security_answer = '{$security_answer}'";
//     $result = mysqli_query($con, $sql);
    
//     if (mysqli_num_rows($result) == 1) {
//         return true;
//     } else {
//         return false;
//     }
// }
// function getUser($name){
//     $con = getConnection();
//     $sql = "SELECT * FROM user WHERE username = '{$name}'";
//     $result = mysqli_query($con, $sql);
//     return mysqli_fetch_assoc($result);
//     }

//     function getApprovedUser($user_type_filter) {
//         $con = getConnection();
//         $sql = "SELECT * FROM user WHERE is_approved = '1'";

//         if ($user_type_filter) {
//             $sql .= " AND user_type = '{$user_type_filter}'";
//         }

//         $result = mysqli_query($con, $sql);
//         $users = [];
//         while($row = mysqli_fetch_assoc($result)) {
//             $users[] = $row;
//         }
//         return $users;
//     }

//     function getAllUser() {
//         $con = getConnection();
//         $sql = "SELECT * FROM user '";
//         $result = mysqli_query($con, $sql);
//         $users = [];
//         while($row = mysqli_fetch_assoc($result)) {
//             $users[] = $row;
//         }
//         return $users;
//     }

//     function getWaitedUser($user_type_filter) {
//         $con = getConnection();
//         $sql = "SELECT * FROM user WHERE is_approved = '0'";

//         if ($user_type_filter) {
//             $sql .= " AND user_type = '{$user_type_filter}'";
//         }
        
//         $result = mysqli_query($con, $sql);
//         $users = [];
//         while($row = mysqli_fetch_assoc($result)) {
//             $users[] = $row;
//         }
//         return $users;
//     }
    

//     function getUserType($username) {
//         $con = getConnection();
//         $sql = "SELECT user_type FROM user WHERE username = '{$username}'";
//         $result = mysqli_query($con, $sql);
    
//         if ($result && mysqli_num_rows($result) > 0) {
//             $row = mysqli_fetch_assoc($result);
//             return $row['user_type']; 
//         } else {
//             return null; 
//         }
//     }

//     function getapprovalstatus($username) {
//         $con = getConnection();
//         $sql = "SELECT is_approved FROM user WHERE username = '{$username}'";
//         $result = mysqli_query($con, $sql);
    
//         if ($result && mysqli_num_rows($result) > 0) {
//             $row = mysqli_fetch_assoc($result);
//             if($row['is_approved']==1)
//             {
//                 return true;
//             }
//             else {
//             return false; 
//             }
//         }
//     }


//     function getTotalUsers() {
//         $con = getConnection();
//     $sql = "SELECT * FROM user ";
//     $result = mysqli_query($con, $sql);
//     $count = mysqli_num_rows($result);

//     return $count;

//     }

//     function getTotalUnapprovedUsers() {
//     $con = getConnection();
//     $sql = "SELECT * FROM user WHERE is_approved = '0'";
//     $result = mysqli_query($con, $sql);
//     $count = mysqli_num_rows($result);

//     return $count;

//     }
//     function getTotalAdmins() {
//         $con = getConnection();
//         $sql = "SELECT * FROM user WHERE user_type = 'admin'";
//         $result = mysqli_query($con, $sql);
//         $count = mysqli_num_rows($result);
        
//         return $count;
        
//         }
    
    
    
//         function getTotalOperators() {
//         $con = getConnection();
//         $sql = "SELECT * FROM user WHERE user_type = 'operator'";
//         $result = mysqli_query($con, $sql);
//         $count = mysqli_num_rows($result);
            
//         return $count;
            
//         }
        
//     function getTotalTravellers() {
//         $con = getConnection();
//         $sql = "SELECT * FROM user WHERE user_type = 'traveller'";
//         $result = mysqli_query($con, $sql);
//         $count = mysqli_num_rows($result);
    
//         return $count;
    
//         }
//         function approveUser($username) {
//             $con = getConnection();
//             $sql = "UPDATE user SET is_approved = '1' WHERE username = '{$username}'";
//             if (mysqli_query($con, $sql)) {
//                 return true;
//                 }
//             else {
//                 return false;
//             }
//         }

// function getUser($username){
//     $con = getConnection();
//     $sql = "SELECT * FROM user WHERE username = '{$username}'";
//     $result = mysqli_query($con, $sql);
//     $row= mysqli_fetch_assoc($result);
//     return $row; 
// }



//---------Bus management codes-------


function updateUser($username, $fullname, $email, $phone, $dob, $password) {
    $conn = getConnection(); 
    $sql = "UPDATE user 
            SET fullname = '$fullname', 
                email = '$email', 
                phone = '$phone', 
                dob = '$dob', 
                password = '$password' 
            WHERE username = '$username'";
    $result = mysqli_query($conn, $sql);
    return $result; 
}



function addBus($busId, $busType, $startLocation, $endLocation, $totalSeats, 
                $startTime, $endTime, $pricePerSeat,$username) {
    $conn = getConnection();
    $sql = "INSERT INTO buses (busId, busType, startLocation, endLocation, totalSeats, 
                                startTime, endTime, pricePerSeat,username) 
            VALUES ('$busId', '$busType', '$startLocation', '$endLocation', '$totalSeats', 
                    '$startTime', '$endTime', '$pricePerSeat','$username')";
    $result = mysqli_query($conn, $sql);
    if($result){
        return true;
    }
    else{
        return false;
    }
}
function isBusIdExists($busId)
{
    $conn = getConnection();
    $sql = "SELECT * FROM buses WHERE busId = '{$busId}'";
    $result = mysqli_query($conn, $sql);
    $isExists = false;

    if ($result && mysqli_num_rows($result) > 0) {
        $isExists = true;
    }

    return $isExists;
}



function getAllBuses($username) {
    $conn = getConnection();
    $sql = "SELECT * FROM buses where username='{$username}'";
    $result = mysqli_query($conn, $sql);
    $buses = [];
    if ($result) {
        while ($row = mysqli_fetch_assoc($result)) {
            $buses[] = $row;
        }
    }
    return $buses;
}
function getbus($busId){
    $con = getConnection();
    $sql = "select * from buses where busId='{$busId}'";
    $result = mysqli_query($con, $sql);
    $row = mysqli_fetch_assoc($result);
    return $row;
}

function updateBus($busId, $busType, $startLocation, $endLocation, $totalSeats, 
                    $startTime, $endTime, $pricePerSeat) {
    $conn = getConnection();
    $sql = "UPDATE buses 
            SET busType = '$busType', 
                startLocation = '$startLocation', 
                endLocation = '$endLocation', 
                totalSeats = '$totalSeats', 
                startTime = '$startTime', 
                endTime = '$endTime', 
                pricePerSeat = '$pricePerSeat' 
            WHERE busId = '$busId'";

    $result = mysqli_query($conn, $sql);
    if($result){
        return true;
    }
    else{
        return false;
    }
}

function deleteBus($busId) {
    $conn = getConnection();
    $sql = "DELETE FROM buses WHERE busId = '$busId'";
    $result = mysqli_query($conn, $sql);
    if($result){
        return true;
    }
    else{
        return false;
    }
}
function getBookingHistory($username)
{
    $conn = getConnection(); 
    $sql = "SELECT busId, passengerName, bookingDate, contactNumber FROM 
            bookings where username='{$username}' ORDER BY bookingDate DESC";
    $result = mysqli_query($conn, $sql);
    $history = [];
    if ($result) {
        while ($row = mysqli_fetch_assoc($result)) {
            $history[] = $row;
        }
    }
    return $history;
}
function getEarningSummary($username) {
    $conn = getConnection(); 
    $sql = "SELECT date, busId, riders, grossEarnings, commission FROM 
            earnings_summary where username='{$username}' ORDER BY date DESC";
    $result = mysqli_query($conn, $sql);
    $earnings = []; 

    if ($result) {
        while ($row = mysqli_fetch_assoc($result)) {
            $earnings[] = $row;
        }
    }
    return $earnings;
}

function searchBuses($username, $search)
{
    $conn = getConnection();
    $sql = "SELECT * FROM buses 
            WHERE username='{$username}' AND 
            (busId LIKE '%{$search}%' 
            OR busType LIKE '%{$search}%' 
            OR startLocation LIKE '%{$search}%' 
            OR endLocation LIKE '%{$search}%')
            ORDER BY busId ASC";
    $result = mysqli_query($conn, $sql);
    $buses = [];
    if ($result) {
        while ($row = mysqli_fetch_assoc($result)) {
            $buses[] = $row;
        }
    }
    return $buses;
}
function searchEarnings($username, $search)
{
    $conn = getConnection();
    $sql = "SELECT date, busId, riders, grossEarnings, commission 
            FROM earnings_summary 
            WHERE username = '{$username}' 
            AND (busId LIKE '%{$search}%' OR date LIKE '%{$search}%')
            ORDER BY date DESC";
    $result = mysqli_query($conn, $sql);
    $earnings = [];

    if ($result) {
        while ($row = mysqli_fetch_assoc($result)) {
            $earnings[] = $row;
        }
    }

    return $earnings;
}

?>
