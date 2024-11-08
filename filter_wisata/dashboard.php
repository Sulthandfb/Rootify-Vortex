<?php 
session_start();
include "db_connect.php"; // Pastikan file db_connect.php berada di direktori yang sama



?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Destinasi Favorit</title>
    <link rel="stylesheet" href="dashboard.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <a href="#" class="nav-brand">
                <img src="logo1.png" alt="Logo Tim" class="logo">
                <span class="brand-text">Rootify</span>
            </a>
            <button class="nav-toggle" id="navToggle">
                <span></span>
                <span></span>
                <span></span>
            </button>
            <div class="nav-menu" id="navMenu">
                <ul class="nav-links">
                    <li><a href="#">Trip</a></li>
                    <li><a href="#">Destinasi</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="#">Bantuan</a></li>
                </ul>
                <div class="nav-buttons">
                    <a href="/regristasi/login.html" class="btn">Login</a>
                    <a href="#" class="btn">Daftar</a>
                </div>
            </div>
        </div>
    </nav>

    <nav class="secondary-navbar">
        <div class="nav-container">
            <ul class="secondary-nav-links">
                <li><a href="#" class="secondary-nav-link active">Home</a></li>
                <li><a href="akomodasi.php" class="secondary-nav-link">Akomodasi</a></li>
                <li><a href="index.php" class="secondary-nav-link">Filter</a></li>
                <li><a href="#" class="secondary-nav-link">Makan</a></li>
                <li><a href="#" class="secondary-nav-link">Harga</a></li>
            </ul>
        </div>
    </nav>

    <div class="hero">
        <div class="hero-content">
            <h1>Grow Your Story</h1>
            <div class="search-container">
                <form class="search-form">
                    <div class="search-input">
                        <i class="fas fa-money-bill"></i>
                        <input type="number" placeholder="Budget (Rp)">
                    </div>
                    <div class="search-input">
                        <i class="fas fa-map-marker-alt"></i>
                        <select>
                            <option value="">Pilih Kabupaten</option>
                            <option value="sleman">Sleman</option>
                            <option value="bantul">Bantul</option>
                            <option value="kulonprogo">Kulon Progo</option>
                            <option value="gunungkidul">Gunung Kidul</option>
                            <option value="jogja">Yogyakarta</option>
                        </select>
                    </div>
                    <div class="search-input">
                        <i class="fas fa-users"></i>
                        <input type="number" placeholder="Jumlah Orang" min="1">
                    </div>
                    <button type="submit" class="search-button">Cari</button>
                </form>
            </div>
        </div>
    </div>

    <div class="main-container">
        <h2>Kunjungi Tempat Favoritmu Di Jogja</h2>
        <div class="destinations-wrapper">
            <div class="destination-card">
                <img src="parangtritis.jpg" class="destination-img" alt="Pantai Parangtritis">
                <p class="caption">Pantai Parangtritis</p>
            </div>
            <div class="destination-card">
                <img src="alun-alun.jpg" class="destination-img" alt="Alun-Alun Kidul">
                <p class="caption">Alun-Alun Kidul</p>
            </div>
            <div class="destination-card">
                <img src="malioboro.jpg" class="destination-img" alt="Malioboro">
                <p class="caption">Malioboro</p>
            </div>
            <div class="destination-card">
                <img src="borobudur.jpg" class="destination-img" alt="Candi Borobudur">
                <p class="caption">Candi Borobudur</p>
            </div>
            <div class="destination-card">
                <img src="prambanan.jpg" class="destination-img" alt="Candi Prambanan">
                <p class="caption">Candi Prambanan</p>
            </div>
            <div class="destination-card">
                <img src="parangtritis.jpg" class="destination-img" alt="Pantai Parangtritis">
                <p class="caption">Pantai Parangtritis</p>
            </div>
            <div class="destination-card">
                <img src="alun-alun.jpg" class="destination-img" alt="Alun-Alun Kidul">
                <p class="caption">Alun-Alun Kidul</p>
            </div>
        </div>
    </div>

    <div class="main-container-2">
        <h2>Pilih Paket Perjalananmu Sekarang!</h2>
        <div class="trip-cards-container">
            <div class="trip-card">
                <img src="logoaja.png" alt="Paket Wisata" class="trip-image">
                <div class="trip-details">
                    <div class="trip-features">
                        <div class="feature">
                            <i class="fas fa-clock"></i>
                            <p>1 Hari</p>
                        </div>
                        <div class="feature">
                            <i class="fas fa-map-marker"></i>
                            <p>3 Tempat</p>
                        </div>
                        <div class="feature">
                            <i class="fas fa-utensils"></i>
                            <p>2x Makan</p>
                        </div>
                    </div>
                </div>
                <div class="price-booking">
                    <div class="price">Rp 500.000</div>
                    <button class="book-button">Pesan</button>
                </div>
            </div>
            <div class="trip-card">
                <img src="logoaja.png" alt="Paket Wisata" class="trip-image">
                <div class="trip-details">
                    <div class="trip-features">
                        <div class="feature">
                            <i class="fas fa-clock"></i>
                            <p>1 Hari</p>
                        </div>
                        <div class="feature">
                            <i class="fas fa-map-marker"></i>
                            <p>3 Tempat</p>
                        </div>
                        <div class="feature">
                            <i class="fas fa-utensils"></i>
                            <p>2x Makan</p>
                        </div>
                    </div>
                </div>
                <div class="price-booking">
                    <div class="price">Rp 500.000</div>
                    <button class="book-button">Pesan</button>
                </div>
            </div>
            <div class="trip-card">
                <img src="logoaja.png" alt="Paket Wisata" class="trip-image">
                <div class="trip-details">
                    <div class="trip-features">
                        <div class="feature">
                            <i class="fas fa-clock"></i>
                            <p>1 Hari</p>
                        </div>
                        <div class="feature">
                            <i class="fas fa-map-marker"></i>
                            <p>3 Tempat</p>
                        </div>
                        <div class="feature">
                            <i class="fas fa-utensils"></i>
                            <p>2x Makan</p>
                        </div>
                    </div>
                </div>
                <div class="price-booking">
                    <div class="price">Rp 500.000</div>
                    <button class="book-button">Pesan</button>
                </div>
            </div>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>