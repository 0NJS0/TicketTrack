<?php
session_start();
require_once('../model/offerModel.php');

if (!isset($_COOKIE['status'])) {
    header('location: login.html');
    exit();
}

$offers = getAllPromotionalOffers();
?>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="../asset/css/offers.css">
<script src="../asset/javascript/offers.js" defer></script>
    <title>Add Promotional Offer</title>
</head>
<body>

    <div class="container">
        <h2>Add Promotional Offer</h2>
        <form method="post"  onsubmit="return validateOffer()">
            <div>
                Title:
                <input type="text" id="title" name="title" >
            </div>
            <div>
                Description:
                <textarea name="description" id="description" rows="5" cols="50" ></textarea>
            </div>

            <div class="date-fields">
                <div>
                    Start Date:
                    <input type="date" id="startdate" name="start_date" >
                </div>
                <div>
                    End Date:
                    <input type="date" id="enddate" name="end_date" >
                </div>
            </div>

            <div>
                Discount Amount:
                <input type="number" id="amount" name="amount" >
            </div>
            <div>
                <input type="submit" name="offer_submit" value="Insert Offer">
            </div>
        </form>

        <div class="back-link">
            <a href="Admin_menu.php">Back to Menu</a>
        </div>

        <h2>Existing Offers</h2>

        <table>
            <tr>
                <th>Offer ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Discount Amount</th>
                <th>Action</th>
            </tr>
            <?php if (!empty($offers)) { ?>
                <?php foreach ($offers as $offer) { ?>
                    <tr>
                        <td><?= $offer['id']; ?></td>
                        <td><?= htmlspecialchars($offer['title']); ?></td>
                        <td><?= htmlspecialchars($offer['description']); ?></td>
                        <td><?= $offer['start_date']; ?></td>
                        <td><?= $offer['end_date']; ?></td>
                        <td><?= $offer['discount_amount']; ?></td>
                        <td>
                            <a class="remove-link" href="../controller/removeOffer.php?id=<?= $offer['id']; ?>">Remove Offer</a>
                        </td>
                    </tr>
                <?php } ?>
            <?php } else { ?>
                <tr>
                    <td colspan="7" align="center">No Running Offer</td>
                </tr>
            <?php } ?>
        </table>
    </div>

</body>
</html>
