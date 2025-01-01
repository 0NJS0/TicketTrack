<?php

    function getConnection(){
        $con = mysqli_connect('127.0.0.1', 'root', '', 'tickettrack');
        return $con;
    }

    function insertfaq($question,$answer,$type,$user_type)
    {
        $con = getConnection();
        $sql = "INSERT INTO faq VALUES ('','{$question}', '{$answer}','{$type}', '{$user_type}')";
        
        if (mysqli_query($con, $sql)) {
            return true;
        } else {
            return false;
        }
    }

    function fetchFAQs() {
        $con = getConnection();
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
    function getQuestion() {
        $con = getConnection();
    }   

    function getAnswer() {
        $con = getConnection();
    } 

    