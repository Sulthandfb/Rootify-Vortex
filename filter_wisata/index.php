<?php
// db_connect.php
$hostname = "localhost";
$username = "root"; // Sesuaikan dengan username database Anda
$password = "";     // Sesuaikan dengan password database Anda
$database_name = "erd_rootify"; // Nama database Anda

$db = mysqli_connect($hostname, $username, $password, $database_name);

if (!$db) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trip Planner</title>
    <link rel="stylesheet" href="filter.css">
</head>
<body>
    <div class="container">
        <form id="tripForm" method="POST" action="results.php">
            <h1>Plan Your Trip</h1>
            
            <!-- Date Selection -->
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate" required>

            <label for="endDate">End Date:</label>
            <input type="date" id="endDate" name="endDate" required>

            <!-- Trip Type -->
            <label for="tripType">Trip Type:</label>
            <select id="tripType" name="tripType" required>
                <option value="solo">Solo</option>
                <option value="partner">Partner</option>
                <option value="friends">Friends</option>
                <option value="family">Family</option>
            </select>

            <!-- Budget Selection -->
            <label for="budget">Budget:</label>
            <select id="budget" name="budget" required>
                <option value="low">Low</option>
                <option value="medium">Medium</option>
                <option value="high">High</option>
            </select>

            <!-- Interests -->
            <label>Interests:</label>
            <label><input type="checkbox" name="interests[]" value="nature"> Nature</label>
            <label><input type="checkbox" name="interests[]" value="culture"> Culture</label>
            <label><input type="checkbox" name="interests[]" value="shopping"> Shopping</label>
            <label><input type="checkbox" name="interests[]" value="food"> Food</label>
            <label><input type="checkbox" name="interests[]" value="scenic"> Scenic</label>
            <label><input type="checkbox" name="interests[]" value="beach"> Beach</label>

            <button type="submit" name="submit">Search</button>
        </form>
    </div>
</body>
</html>
