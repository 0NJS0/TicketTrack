<?php 
session_start();
require('../model/FAQModel.php');

if (isset($_REQUEST['faq_submit'])) {
    $question = trim($_POST['question']);
    $answer = trim($_POST['answer']);
    $type = trim($_POST['type']);
    $user_type = $_POST['user_type'];

    if (!empty($question) && !empty($answer) && !empty($type) && !empty($user_type)) {
        $status=insertfaq($question,$answer,$type,$user_type);
        if ($status) {
            header('location: ../view/insertfaq.php');
        }
        else
        {
            echo"could not add FAQ";
        }
        }
    else {
    echo "All fields are required!";
    }
}
?>