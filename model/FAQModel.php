<?php

    function getfaqConnection(){
        $con = mysqli_connect('127.0.0.1', 'root', '', 'tickettrack');
        return $con;
    }

    function insertfaq($question,$answer,$type,$user_type)
    {
        $con = getfaqConnection();
        $sql = "INSERT INTO faq VALUES ('','{$question}', '{$answer}','{$type}', '{$user_type}')";
        
        if (mysqli_query($con, $sql)) {
            return true;
        } else {
            return false;
        }
    }

    function fetchFAQs() {
        $con = getfaqConnection();
        $sql = "SELECT * FROM faq";
        $result = mysqli_query($con, $sql);
        $faqs=[];
        if ($result) {
            while ($row = mysqli_fetch_assoc($result)) {
                $faqs[] = $row;
            }
            return $faqs;
        } 
    }

    function viewFAQs($usertype) {
        $con = getfaqConnection();
        $sql = "SELECT * FROM faq WHERE user_type = '{$usertype}' OR user_type = 'both'";
        $result = mysqli_query($con, $sql);
        $faqs=[];
        if ($result) {
            while ($row = mysqli_fetch_assoc($result)) {
                $faqs[] = $row;
            }
            return $faqs;
        } 
    }

    function getQuestion() {
        $con = getfaqConnection();
    }   

    function getAnswer() {
        $con = getfaqConnection();
    } 

    