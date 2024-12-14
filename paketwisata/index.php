<?php
// Koneksi ke database
$db = new mysqli("localhost", "root", "", "erd_rootify"); // Ganti "nama_database" sesuai database Anda

if ($db->connect_error) {
    die("Koneksi gagal: " . $db->connect_error);
}

// Ambil parameter `nama` dari URL
if (isset($_GET['nama'])) {
    $nama = $_GET['nama'];

    // Query untuk mendapatkan data berdasarkan `nama`
    $sql = "SELECT * FROM paket WHERE nama = ?";
    $stmt = $db->prepare($sql);
    $stmt->bind_param("s", $nama);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        ?>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Detail Paket</title>
            <link rel="stylesheet" href="style.css"> <!-- Ganti jika ada file CSS -->
        </head>
        <body>
            <h1><?= htmlspecialchars($row['nama']); ?></h1>
            <p><?= htmlspecialchars($row['deskripsi']); ?></p>
            <img src="<?= htmlspecialchars($row['gambar']); ?>" alt="Gambar Paket" style="width: 300px;">
            <p>Jam buka: <?= htmlspecialchars($row['jam_buka']); ?></p>
            <p>Jam tutup: <?= htmlspecialchars($row['jam_tutup']); ?></p>
        </body>
        </html>
        <?php
    } else {
        echo "Paket tidak ditemukan.";
    }
} else {
    echo "Parameter nama tidak ditemukan.";
}

// Tutup koneksi database
$db->close();
?>
