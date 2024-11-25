<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Metadata for character set and viewport settings -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Title for the web page -->
    <title>Booking Failed</title>

    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CSS for using icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        /* Gradient background from red to white for the body */
        body {
            background: linear-gradient(to bottom, #ff4d4d, #ffffff);
            height: 100vh; /* Full viewport height */
            display: flex; /* Use flexbox for centering */
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            text-align: center; /* Center text */
            margin: 0; /* Remove default margins */
            font-family: Arial, sans-serif; /* Set font family */
        }

        /* Styling for the content box */
        .content {
            background-color: white; /* White background */
            padding: 30px 40px; /* Padding inside the box */
            border-radius: 15px; /* Rounded corners */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Soft shadow effect */
            width: 100%; /* Full width */
            max-width: 500px; /* Maximum width */
        }

        /* Styling for the failure icon */
        .failure-icon {
            font-size: 80px; /* Large icon size */
            color: #ff4d4d;  /* Red color */
            margin-bottom: 20px; /* Space below the icon */
            text-shadow: 0 0 10px rgba(255, 77, 77, 0.8), 0 0 20px rgba(255, 77, 77, 0.6), 0 0 30px rgba(255, 77, 77, 0.4); /* Glowing effect */
        }

        /* Styling for the heading (Booking Failed) */
        h2 {
            font-size: 2rem; /* Larger font size */
            color: #294067; /* Dark blue color */
            font-weight: bold; /* Bold text */
        }

        /* Styling for the link */
        a {
            font-size: 1.1rem; /* Slightly larger font size */
            text-decoration: none; /* Remove underline */
            color: #294067; /* Dark blue color */
            border: 2px solid #294067; /* Border around the link */
            padding: 10px 20px; /* Padding around the text */
            border-radius: 5px; /* Rounded corners */
            transition: all 0.3s ease; /* Smooth transition effect */
        }

        /* Hover effect for the link */
        a:hover {
            background-color: #294067; /* Change background color on hover */
            color: white; /* Change text color to white on hover */
        }
    </style>
</head>
<body>

    <!-- Main content of the page -->
    <div class="content">
        <div class="failure-icon">
            <!-- Glowing failure icon from Bootstrap Icons -->
            <i style="color: #ff4d4d" class="bi bi-x-circle"></i>
        </div>
        <div style="display:flex; flex-direction:column; gap:2rem;">
            <!-- Heading for failure message -->
            <h2>Booking failed</h2>
            <!-- Link to go back to the home page -->
            <a href="index.html">Go Back to Home</a>
        </div>
    </div>

    <!-- Bootstrap Icons JS (optional for some icons) -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
</body>
</html>
