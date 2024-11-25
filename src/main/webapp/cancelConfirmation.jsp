<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cancellation Confirmation</title> <!-- Title of the page -->
    
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons for the success icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <style>
        /* Gradient background from light blue to white */
        body {
            background: linear-gradient(to bottom, #b3d9ff, #ffffff); /* Apply gradient background */
            height: 100vh; /* Full viewport height */
            display: flex; /* Flexbox to center the content */
            justify-content: center; /* Center content horizontally */
            align-items: center; /* Center content vertically */
            text-align: center; /* Center text */
            margin: 0; /* Remove default margin */
            font-family: Arial, sans-serif; /* Set font family */
        }

        .content {
            background-color: white; /* Set background color to white */
            padding: 30px 40px; /* Padding inside content box */
            border-radius: 15px; /* Rounded corners */
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Soft shadow around the box */
            width: 100%; /* Full width */
            max-width: 500px; /* Maximum width of the content box */
        }

        .success-icon {
            font-size: 80px; /* Large icon size */
            color: #294067; /* Dark Blue color for icon */
            margin-bottom: 20px; /* Space below the icon */
            text-shadow: 0 0 5px rgba(41, 64, 103, 0.8), 0 0 10px rgba(41, 64, 103, 0.6), 0 0 20px rgba(41, 64, 103, 0.4); /* Glowing effect for icon */
        }

        h2 {
            font-size: 2rem; /* Font size for heading */
            color: #294067; /* Dark Blue color for heading */
            font-weight: bold; /* Make heading bold */
        }

        p {
            font-size: 1.2rem; /* Larger text for message */
            color: #333; /* Dark color for paragraph */
        }

        a {
            font-size: 1.1rem; /* Font size for the link */
            text-decoration: none; /* Remove underline from link */
            color: #294067; /* Dark Blue color for link */
            border: 2px solid #294067; /* Dark Blue border */
            padding: 10px 20px; /* Padding inside the link */
            border-radius: 5px; /* Rounded corners for the link */
            transition: all 0.3s ease; /* Smooth transition for hover effect */
        }

        a:hover {
            background-color: #294067; /* Dark Blue background on hover */
            color: white; /* White text on hover */
        }
    </style>
</head>
<body>

    <!-- Content section with confirmation message -->
    <div class="content">
        <div class="success-icon">
            <!-- Success icon using Bootstrap Icons -->
            <i class="bi bi-check-circle"></i>
        </div>
        <h2>Cancellation Successful</h2> <!-- Heading for confirmation -->
        <!-- Message retrieved from the request attribute -->
        <p><%= request.getAttribute("message") %></p> 
        <!-- Link to search flights -->
        <a href="index.html">Search Flights</a>
    </div>

    <!-- Bootstrap Icons JS for the success icon -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
</body>
</html>
