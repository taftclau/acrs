<?php
session_start();
include 'session_check.php';
include 'db_connect.php';
include 'helpers.php'; // Include centralized functions

// Get all transactions ordered by most recent first
$result = getAllTransactionHistory($conn);

// Get user profile info if logged in (for sidebar)
$username = isset($_SESSION['username']) ? $_SESSION['username'] : 'Guest';
$profile_picture = isset($_SESSION['profile_picture']) ? $_SESSION['profile_picture'] : 'profile.jpg';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/6/6b/Bitcoin_Logo.ico" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="darkmode.css">
    <link rel="stylesheet" href="sidebar.css">

    <style>
        /* Specific styles for the transaction history page */
        .transaction-header {
            background: rgba(14, 58, 102, 0.8);
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            color: white;
            text-align: center;
        }

        .profile-pic {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #ffffff;
    display: block;
}

        .transaction-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: gray;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        .transaction-table th, 
        .transaction-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #eaeaea;
        }

        .transaction-table th {
            background-color: rgba(14, 58, 102, 0.8);
            color: white;
            font-weight: bold;
        }

        .transaction-table tr:hover {
            background-color:rgb(128, 116, 116);
        }

        .transaction-table tr:last-child td {
            border-bottom: none;
        }

        .Deposit {
            color: #4CAF50;
            font-weight: bold;
        }

        .Withdrawal {
            color: #f44336;
            font-weight: bold;
        }

        .back-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #0077ff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-bottom: 20px;
            transition: background-color 0.3s;
        }

        .back-button:hover {
            background-color: #0058ba;
        }

        .no-records {
            text-align: center;
            padding: 20px;
            font-style: italic;
            color: #666;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .cv-container {
            background: rgba(14, 58, 102, 0.8);
            padding: 20px;
            border-radius: 10px;
            color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
      
    </style>
</head>
    <?php include 'sidebar.php'; ?>

    <!-- Main Content -->
    <div class="main-content">
        <div class="transaction-header">
            <h2>Transaction History</h2>
        </div>

        <a href="displaymem.php" class="back-button">
            <i class="fas fa-arrow-left"></i> Back to Members
        </a>

        <div class="cv-container">
            <?php if ($result && $result->num_rows > 0): ?>
                <table class="transaction-table">
                    <thead>
                        <tr>
                            <th>Date & Time</th>
                            <th>Account Number</th>
                            <th>Member Name</th>
                            <th>Transaction Type</th>
                            <th>Amount</th>
                            <th>Current Balance</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = $result->fetch_assoc()): ?>
                            <tr>
                                <td><?php echo date('M d, Y g:i A', strtotime($row['transaction_date'])); ?></td>
                                <td><?php echo htmlspecialchars($row['account_number']); ?></td>
                                <td>
                                    <?php 
                                        $name = '';
                                        if (isset($row['firstname']) && isset($row['lastname'])) {
                                            $name = htmlspecialchars($row['firstname'] . ' ' . $row['lastname']);
                                        } else {
                                            $name = 'Unknown';
                                        }
                                        echo $name;
                                    ?>
                                </td>
                                <td class="<?php echo $row['transaction_type']; ?>">
                                    <?php echo $row['transaction_type']; ?>
                                </td>
                                <td>₱<?php echo number_format($row['amount'], 2); ?></td>
                                <td>₱<?php echo isset($row['balance']) ? number_format($row['balance'], 2) : 'N/A'; ?></td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            <?php else: ?>
                <div class="no-records">
                    <p>No transaction history found.</p>
                </div>
            <?php endif; ?>
        </div>
    </div>

    <script src="sidebar.js"></script>
    <script src="darkmode.js"></script>
</body>
</html>