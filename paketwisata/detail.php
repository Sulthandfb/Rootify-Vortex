<?php
// Koneksi ke database
$db = new mysqli("localhost", "root", "", "erd_rootify"); // Ganti "nama_database" sesuai database Anda

if ($db->connect_error) {
    die("Koneksi gagal: " . $db->connect_error);
}

// Query untuk mendapatkan semua data dari tabel `paket`
$sql = "SELECT * FROM paket";
$result = $db->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page</title>
    <link rel="stylesheet" href="style.css"> <!-- Ganti jika ada file CSS -->
</head>
<body>
    <h1>Daftar Paket Wisata</h1>
    <div class="paket-list">
        <?php
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                ?>
                <div class="price-container">
                    <h4><?= htmlspecialchars($row['nama']); ?></h4>
                    <a href="index.php?nama=<?= urlencode($row['nama']); ?>" class="btn btn-primary">View Rooms</a>
                </div>
                <?php
            }
        } else {
            echo "<p>Tidak ada paket tersedia.</p>";
        }
        ?>
    </div>
</body>
</html>

<?php
// Tutup koneksi database
$db->close();
?>
