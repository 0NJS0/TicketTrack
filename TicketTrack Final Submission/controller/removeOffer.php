<?php 
session_start();
require('../model/offerModel.php');
if(!isset($_COOKIE['status'])){
    header('location: login.html');  
}

if(isset($_REQUEST['id'])){
    $offer_id=$_REQUEST['id'];

    $status= deletePromotionalOffer($offer_id);
    if($status){
        header('location: ../view/offers.php');
    }else{
        echo 'Failed To Read Notification';
    }
}

else{
    header('location: ../view/offers.php');
}