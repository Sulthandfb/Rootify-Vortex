<?php
// Koneksi ke database
$conn = new mysqli("localhost", "root", "", "erd_rootify");

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Ambil data dari tabel
$query = "SELECT * FROM tempat_wisata";
$result = $conn->query($query);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Daftar Tempat Wisata</title>
</head>
<body>
    <h1>Daftar Tempat Wisata</h1>
    <?php while ($row = $result->fetch_assoc()): ?>
        <div>
            <h2><?= $row['nama'] ?></h2>
            <p><?= $row['deskripsi'] ?></p>
            <img src="<?= $row['url_gambar'] ?>" alt="<?= $row['nama'] ?>" width="200">
            <a href="detail.php?id=<?= $row['id_wisata'] ?>">View Detail</a>
        </div>
    <?php endwhile; ?>
</body>
</html>
