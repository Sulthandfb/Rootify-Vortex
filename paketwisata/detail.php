<?php
// Koneksi ke database
$conn = new mysqli("localhost", "root", "", "erd_rootify");

if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Ambil data berdasarkan ID
if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $query = "SELECT * FROM tempat_wisata WHERE id_wisata = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = $result->fetch_assoc();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Detail Tempat Wisata</title>
</head>
<body>
    <?php if ($data): ?>
        <h1><?= $data['nama'] ?></h1>
        <p><?= $data['deskripsi'] ?></p>
        <img src="<?= $data['url_gambar'] ?>" alt="<?= $data['nama'] ?>" width="400">
        <p>Alamat: <?= $data['alamat'] ?></p>
        <p>Kategori: <?= $data['kategori'] ?></p>
        <p>Rating: <?= $data['rating'] ?></p>
        <p>Jam Buka: <?= $data['jam_buka'] ?> - <?= $data['jam_tutup'] ?></p>
    <?php else: ?>
        <p>Data tidak ditemukan!</p>
    <?php endif; ?>
</body>
</html>
