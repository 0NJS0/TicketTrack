<?php 
session_start();
require('../model/offerModel.php');
require_once('../model/notificationModel.php');
if(!isset($_COOKIE['status'])){
    header('location: login.html');  
}

if (isset($_REQUEST['formData'])) {
    $inputData = json_decode($_POST['formData'], true);

    $title =trim($inputData['title']);
    $description = trim($inputData['description']);
    $startdate = trim($inputData['start_date']);
    $enddate = $inputData['end_date'];
    $amount = $inputData['amount'];


    $response = [];
    if (insertPromotionalOffer($title, $description, $startdate, $enddate,$amount)) {
        $message=$description;
        if(addOfferNotification($message))
        {
            $response['success'] = true;
            $response['message'] = "Offer Inserted!";
        }  
        else
        {
            $response['success'] = true;
            $response['message'] = "Offer inserted but notification not be Inserted!";
        }
    }
    else {
        $response['success'] = false;
        $response['message'] = "Offer could not be Inserted!";
    }
    echo json_encode($response);
    exit();
}
    


    if (isset($_REQUEST['offer_submit'])) {
        $title = trim($_POST['title']);
        $description = trim($_POST['description']);
        $startdate = trim($_POST['start_date']);
        $enddate = trim($_POST['end_date']);
        $amount= $_POST['amount'];

        if (!empty($title) && !empty($description) && !empty($startdate) && !empty($enddate) && !empty($amount))
        {
            if (insertPromotionalOffer($title, $description, $startdate, $enddate,$amount)) {
                $message=$description;
                if(addOfferNotification($message))
                {
                header('location: ../view/offers.php');
                }
            } else {
                echo "Failed to add promotional offer.";
            }
            }
            else {
            echo "All fields are required!";
            }
        }
        else {
            header("../view/Admin_menu.php");
        }

?>