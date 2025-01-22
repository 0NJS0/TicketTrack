<?php 
session_start();
require('../model/FAQModel.php');
if(!isset($_COOKIE['status'])){
    header('location: login.html');  
}

if (isset($_REQUEST['signupData'])) {
    $inputData = json_decode($_POST['signupData'], true);

    $question =trim($inputData['question']);
    $answer = trim($inputData['answer']);
    $type = trim($inputData['type']);
    $user_type = $inputData['user_type'];

    if (!empty($question) && !empty($answer) && !empty($type) && !empty($user_type)) {
        $response = [];
        $status= insertfaq($question,$answer,$type,$user_type);
        if ($status) {
            $response['success'] = true;
            $response['message'] = "FAQ Inserted!";
        }
        else
        {
            $response['success'] = true;
            $response['message'] = "FAQ could not be Inserted!";
        }
        echo json_encode($response);
        exit();
    }

}

?>