<?php
function getConnectionforOffer() {
    $con = mysqli_connect('127.0.0.1', 'root', '', 'tickettrack');
    return $con;
}

function insertPromotionalOffer($title, $description, $start_date, $end_date,$amount) {
    $con = getConnectionforOffer();
    $sql = "INSERT INTO offers VALUES ('','{$title}', '{$description}', '{$start_date}', '{$end_date}','{$amount}')";
    if(mysqli_query($con, $sql))
    {
        return true;
    }
    else{
        return false;
    }
}

function getAllPromotionalOffers() {
    $con = getConnectionforOffer();
    $sql = "SELECT * FROM offers ";
    $result = mysqli_query($con, $sql);
    $offers = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $offers[] = $row;
    }
    return $offers;
}

function deletePromotionalOffer($id) {
    $con = getConnectionforOffer();
    $sql = "DELETE FROM offers WHERE id = {$id}";
    return mysqli_query($con, $sql);
}