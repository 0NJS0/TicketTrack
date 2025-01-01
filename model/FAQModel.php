<?php

    function getConnection(){
        $con = mysqli_connect('127.0.0.1', 'root', '', 'tickettrack');
        return $con;
    }

    function getQuestion() {
        $con = getConnection();
    }   

    function getAnswer() {
        $con = getConnection();
    } 

    