<?php
    session_start();
    require_once('../model/FAQModel.php');
    require_once('../model/userModel.php');

    $username=$_SESSION['username'];
    $usertype=getUserType($username);

    if(!isset($_COOKIE['status'])){
        header('location: login.html');  
    }
    $filter = isset($_GET['type']) ? $_GET['type'] : null;

    $faqs = fetchFAQsbyType($filter,$usertype);
?>

<html>
<body>
<?php if ($usertype == 'admin') { ?>
        <a href="./Admin_menu.php"> Back </a>
    <?php } elseif ($usertype == 'operator') { ?>
        <a href="./Operator_menu.php"> Back </a>
    <?php } elseif ($usertype == 'traveller') { ?>
        <a href="./Traveller_menu.php"> Back </a>
    <?php } ?>
<a href="../controller/logout.php"> Logout </a><br>
    <h1>FAQs</h1>
    <br>

    <form method="get" action="">
            Type : 
            <select name="type">
                <option value="">All</option>
                <option value="transaction">Transaction</option>
                <option value="update_profile">Update Profile</option>
                <option value="management">Management</option>
            </select>
            <input type="submit" value="Filter">
        </form>


    <table border="1" cellspacing="0" cellpadding="5">
        <tr>
            <th>Question</th>
            <th>Answer</th>
            <th>Type</th>
        </tr>
        <?php if (!empty($faqs)) { ?>
            <?php foreach ($faqs as $faq) { ?>
                <tr>
                    <td><?= $faq['question'] ?></td>
                    <td><?= $faq['answer'] ?></td>
                    <td><?= $faq['type']?></td>
                </tr>
            <?php } ?>
        <?php } else { ?>
            <tr>
                <td colspan="4" align="center">No FAQs available</td>
            </tr>
        <?php } ?>
    </table>

</body>
</html>