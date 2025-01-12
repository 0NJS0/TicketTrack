<?php
    session_start();
    require_once('../model/offerModel.php');
    if (!isset($_COOKIE['status'])) {
        header('location: login.html');
        exit();
    }
    $offers = getAllPromotionalOffers();
?>

<html>
<head>
    <title>Add Promotional Offer</title>
</head>
<body>
    <h2>Add Promotional Offer</h2>
    <form method="post" action="../controller/offercheck.php">
    <a href="Admin_menu.php">Back</a><br><br>
        Title:
        <input type="text" name="title" required><br><br>
        Description:<br>
        <textarea name="description" rows="5" cols="50" required></textarea><br><br>
        Start Date:
        <input type="date" name="start_date" required><br><br>
        End Date:
        <input type="date" name="end_date" required><br><br>
        Discount Amount:
        <input type="number" name="amount" required><br><br>
        <input type="submit" name="offer_submit" value="Insert Offer">
    </form>
    <a href="Admin_menu.php">Back</a>

    <h2>Existing Offers</h2>

    <table border="1" cellspacing="0" cellpadding="5">
        <tr>
            <th>Offer ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Startdate</th>
            <th>Enddate</th>
            <th>Discount Amount</th>
            <th>Action</th>
        </tr>
        <?php if (!empty($offers)) { ?>
            <?php
            for ($i = 0; $i < count($offers); $i++) { 
            ?>
                <tr>
                <td><?php echo $offers[$i]['id']; ?></td>
                <td><?php echo $offers[$i]['title']; ?></td>
                <td><?php echo $offers[$i]['description']; ?></td>
                <td><?php echo $offers[$i]['start_date']; ?></td>
                <td><?php echo $offers[$i]['end_date']; ?></td>
                <td><?php echo $offers[$i]['discount_amount']; ?></td>
                <td>
                    <a href="../controller/removeOffer.php?id=<?php echo $offers[$i]['id']; ?>">Remove Offer</a>
                    </td>
                </tr>
            <?php } ?>
        <?php } else { ?>
            <tr>
                <td colspan="4" align="center">No Running offer</td>
            </tr>
        <?php } ?>
    </table>
</body>
</html>