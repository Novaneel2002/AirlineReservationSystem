<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Successful</title>
    <!-- Linking Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Linking Bootstrap Icons for using icons like check-circle -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Gradient background from green to white */
        body {
            background: linear-gradient(to bottom, #04ff00, #ffffff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* Styling for the content box */
        .content {
            background-color: white;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        /* Styling for the success icon */
        .success-icon {
            font-size: 80px;
            color: #294067;
            margin-bottom: 20px;
            text-shadow: 0 0 10px rgba(102, 255, 102, 0.8), 0 0 20px rgba(102, 255, 102, 0.6), 0 0 30px rgba(102, 255, 102, 0.4);
        }

        /* Styling for the header text */
        h2 {
            font-size: 2rem;
            color: #294067;
            font-weight: bold;
        }

        /* Styling for the link button */
        a {
            font-size: 1.1rem;
            text-decoration: none;
            color: #294067;
            border: 2px solid #294067;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        /* Hover effect for the link button */
        a:hover {
            background-color: #294067;
            color: white;
        }
    </style>
</head>
<body>

    <!-- Content container -->
    <div class="content">
        <!-- Success icon displayed here -->
        <div class="success-icon">
            <!-- Using Bootstrap Icons for success icon -->
            <i class="bi bi-check-circle" aria-label="Success"></i><!-- Success icon -->
        </div>
        
        <!-- Container for the success message and link -->
        <div style="display:flex; flex-direction:column; gap:2rem;">
            <!-- Booking success message -->
            <h2>Your booking was successful!</h2>
            <!-- Link to go back to the homepage -->
            <a href="index.html" aria-label="Go back to home">Go Back to Home</a>
        </div>
    </div>

</body>
</html>
