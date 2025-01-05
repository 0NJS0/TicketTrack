<?php
    session_start();
    require_once('../model/FAQModel.php');
    require_once('../model/userModel.php');
    $username=$_SESSION['username'];
    $type=getUserType($username);
    $faqs = viewFAQs($type);
    if(!isset($_COOKIE['status'])){
        header('location: login.html');  
    }
?>

<html>
<body>
<a href="./Traveller_menu.php"> Back </a>
<a href="../controller/logout.php"> Logout </a><br>
    <h1>FAQs</h1>
    <br><br>

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