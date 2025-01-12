<?php
    session_start();
    require_once('../model/userModel.php');
    if(!isset($_COOKIE['status'])){
        header('location: login.html');  
    }
    $username_filter = isset($_GET['username']) ? $_GET['username'] : null;
    $user_type_filter = isset($_GET['user_type']) ? $_GET['user_type'] : null;
    $users = getApprovedUserFilter($user_type_filter,$username_filter );
?>


<html lang="en">
<script>
        function searchByUsername() {
            let username = document.getElementById('search_username').value;
            let xhttp = new XMLHttpRequest();

            xhttp.open('GET', 'userlist.php?username=' + username, true);
            xhttp.send();

            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    document.getElementById('user_table_body').innerHTML = this.responseText;
                }
            };
        }
</script>
<head>
    <title>Userlist </title>
</head>
<body>
        <h2>User List</h2>    
        <a href="./Admin_menu.php"> Back </a> | 
        <a href="../controller/logout.php"> logout </a>
        <a href="./approveUser.php"> Unapproved Users </a>
        <br>

        <form method="get" action="">
            User Type : 
            <select name="user_type">
                <option value="">All</option>
                <option value="admin">Admin</option>
                <option value="operator">Operator</option>
                <option value="traveller">Traveller</option>
            </select>
            <input type="submit" value="Filter">
        </form>

        <br>
        Search by Username: <input type="text" id="search_username" onkeyup="searchByUsername()" />
        <br><br>

        <br>

        <table border=1>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Date Of Birth</th>
                    <th>User Type</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody id="user_table_body">
            <?php 
                for($i=0; $i<count($users); $i++){ 
            ?>
            <tr>
            <td><?php echo $users[$i]['id']; ?></td>
                <td><?php echo $users[$i]['username']; ?></td>
                <td><?=$users[$i]['fullname'] ?></td>
                <td><?=$users[$i]['email'] ?></td>
                <td><?=$users[$i]['phone'] ?></td>
                <td><?=$users[$i]['dob'] ?></td>
                <td><?=$users[$i]['user_type'] ?></td>
                <td>
                    <a href="edit.php?name=<?=$users[$i]['username']?>"> EDIT </a> |
                    <a href="../controller/delete.php?name=<?=$users[$i]['username']?>"> DELETE </a> 
                </td>  
            </tr>
            <?php } ?>
            </tbody>
        </table>
</body>
</html>
