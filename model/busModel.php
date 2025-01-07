<?php
    function getConnectionforBus() {
        $con = mysqli_connect('127.0.0.1', 'root', '', 'tickettrack');
        return $con;
    }

    function getTotalBusbyuser($username) {
        $con = getConnectionforBus();
        $sql = "SELECT * FROM bustable WHERE username= '{$username}'";
        $result = mysqli_query($con, $sql);
        $count = mysqli_num_rows($result);

        return $count;

    }

    function getTotalACBusbyuser($username) {
        $con = getConnectionforBus();
        $sql = "SELECT * FROM bustable WHERE username= '{$username}' AND bus_type='AC'";
        $result = mysqli_query($con, $sql);
        $count = mysqli_num_rows($result);

        return $count;

    }

    function getTotalnonACBusbyuser($username) {
        $con = getConnectionforBus();
        $sql = "SELECT * FROM bustable WHERE username= '{$username}' AND bus_type='nonAC'";
        $result = mysqli_query($con, $sql);
        $count = mysqli_num_rows($result);

        return $count;

    }