<?php
// Koneksi ke database
$host = 'localhost'; // Ganti dengan host database Anda
$username = 'root';  // Ganti dengan username database Anda
$password = '';      // Ganti dengan password database Anda
$dbname = 'erd_rootify'; // Ganti dengan nama database Anda

$conn = new mysqli($host, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Ambil data dari database
$sql = "SELECT * FROM tempat_wisata LIMIT 1"; // Ambil 1 data pertama sebagai contoh
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // Simpan data dalam array untuk digunakan di halaman
    $tour = $result->fetch_assoc();
} else {
    $tour = null;
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            margin-bottom: 20px;
        }
        .header h1 {
            font-size: 2rem;
            margin-bottom: 10px;
        }
        .header .info {
            display: flex;
            align-items: center;
            font-size: 0.875rem;
            color: #6b7280;
        }
        .header .info span {
            margin: 0 8px;
        }
        .gallery {
            position: relative;
            margin-bottom: 30px;
            border-radius: 10px;
            overflow: hidden;
        }
        .gallery img {
            width: 100%;
            height: 400px;
            object-fit: cover;
        }
        .gallery-buttons {
            position: absolute;
            top: 50%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            transform: translateY(-50%);
        }
        .gallery-button {
            background: rgba(255, 255, 255, 0.8);
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 50%;
        }
        .grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 20px;
        }
        .card {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .card h2 {
            font-size: 1.25rem;
            margin-bottom: 15px;
        }
        .price {
            font-size: 1.5rem;
            font-weight: bold;
        }
        .buttons {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
        }
        .button {
            background: #1d4ed8;
            color: white;
            padding: 10px;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }
        .button-outline {
            background: transparent;
            border: 2px solid #1d4ed8;
            color: #1d4ed8;
        }
        .description {
            line-height: 1.6;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">
            <h1 id="tour-name"><?= $tour['nama'] ?? 'Loading...' ?></h1>
            <div class="info">
                <span id="tour-rating">⭐ <?= $tour['rating'] ?? 'N/A' ?> (<?= $tour['ulasan'] ?? '0' ?> reviews)</span>
                <span>•</span>
                <span id="tour-location"><?= $tour['lokasi'] ?? 'Unknown' ?></span>
            </div>
        </div>

        <!-- Gallery -->
        <div class="gallery">
            <img id="tour-image" src="<?= $tour['gambar'] ?? 'placeholder.svg' ?>" alt="Tour Image">
            <div class="gallery-buttons">
                <button class="gallery-button">&#9664;</button>
                <button class="gallery-button">&#9654;</button>
            </div>
        </div>

        <!-- Grid -->
        <div class="grid">
            <!-- Left Column -->
            <div class="card">
                <h2>Package Highlights</h2>
                <p class="description" id="tour-description">
                    <?= $tour['deskripsi'] ?? 'No description available.' ?>
                </p>
            </div>

            <!-- Right Column -->
            <div class="card">
                <p class="price" id="tour-price">IDR <?= number_format($tour['harga'] ?? 0, 0, ',', '.') ?></p>
                <p>per person</p>
                <div class="buttons">
                    <a href="#" class="button">Book Now</a>
                    <a href="#" class="button button-outline">Contact Agent</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
