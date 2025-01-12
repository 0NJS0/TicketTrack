<?php
    session_start();
    require_once('../model/FAQModel.php');
    $faqs = fetchFAQs();
    if(!isset($_COOKIE['status'])){
        header('location: login.html');  
    }
?>
<html>
<head>
    <title>Admin FAQ Management</title>
</head>
<body>
    <h1>Manage FAQs</h1>

    <a href="./Admin_menu.php"> Back </a>
    <a href="../controller/logout.php"> Logout </a>
    <br><br>
    <form method="post" action="../controller/addFAQ.php">
        <table border="1" cellspacing="0" cellpadding="5">
            <tr>
                <th colspan="2">Add a New FAQ</th>
            </tr>
            <tr>
                <td>Question:</td>
                <td>
                    <textarea name="question" rows="4" cols="50" required></textarea>
                </td>
            </tr>
            <tr>
                <td>Answer:</td>
                <td>
                    <textarea name="answer" rows="6" cols="50" required></textarea>
                </td>
            </tr>
            <tr>
                <td>Type Of Question:</td>
                <td>
                    <input type="radio" name="type" value="transaction">Transaction
                    <input type="radio" name="type" value="update_profile">Profile Update
                    <input type="radio" name="type" value="management">Management
                </td>
            </tr>
            <tr>
                <td>Visible To:</td>
                <td>
                    <input type="radio" name="user_type" value="traveller">Traveller
                    <input type="radio" name="user_type" value="both">Both
                    <input type="radio" name="user_type" value="operator">Operator
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="faq_submit" value="Add FAQ">
                </td>
            </tr>
        </table>
    </form>

    <h2>Existing FAQs</h2>

    <table border="1" cellspacing="0" cellpadding="5">
        <tr>
            <th>Question</th>
            <th>Answer</th>
            <th>Type</th>
            <th>Visible To</th>
        </tr>
        <?php if (!empty($faqs)) { ?>
            <?php foreach ($faqs as $faq) { ?>
                <tr>
                    <td><?= $faq['question'] ?></td>
                    <td><?= $faq['answer'] ?></td>
                    <td><?= $faq['type']?></td>
                    <td><?= $faq['user_type'] ?></td>
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