<?php 
session_start();
require('../model/offerModel.php');
require_once('../model/notificationModel.php');
if(!isset($_COOKIE['status'])){
    header('location: login.html');  
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