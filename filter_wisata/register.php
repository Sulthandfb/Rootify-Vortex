<?php
session_start();
include "db_connect.php"; // Pastikan file db_connect.php berada di direktori yang sama

// Pesan feedback untuk pengguna
$loginMessage = '';
$registerMessage = '';

// Proses Login
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["login"])) {
    $email = $_POST["email"];
    $password = $_POST["password"];

    // Query untuk mengambil data pengguna berdasarkan email
    $stmt = $db->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        if (password_verify($password, $user["password"])) {
            // Login berhasil
            $_SESSION["user_id"] = $user["id"];
            $_SESSION["username"] = $user["username"];
            header("Location: dashboard.php");
            exit();
        } else {
            $loginMessage = "Password salah.";
        }
    } else {
        $loginMessage = "Email tidak ditemukan.";
    }

    $stmt->close();
}

// Proses Registrasi
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["register"])) {
    $username = $_POST["username"];
    $email = $_POST["email"];
    $password = $_POST["password"];
    $confirmPassword = $_POST["confirmPassword"];

    if ($password !== $confirmPassword) {
        $registerMessage = "Password tidak cocok.";
    } else {
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        $stmt = $db->prepare("SELECT * FROM users WHERE username = ? OR email = ?");
        $stmt->bind_param("ss", $username, $email);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $registerMessage = "Username atau email sudah terdaftar.";
        } else {
            $stmt = $db->prepare("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
            $stmt->bind_param("sss", $username, $email, $hashedPassword);
            $stmt->execute();

            if ($stmt->affected_rows > 0) {
                $registerMessage = "Registrasi berhasil!";
            } else {
                $registerMessage = "Registrasi gagal. Silakan coba lagi.";
            }
        }

        $stmt->close();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Register Form</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container <?php echo isset($_POST["register"]) ? 'register-mode' : ''; ?>">
        <!-- Login Section -->
        <div class="form-container login-container">
            <div class="image-section">
                <img src="../img/logo.png" alt="Login Image">
            </div>
            <div class="form-section">
                <div class="form">
                    <h2>Welcome Back!</h2>
                    <form id="loginForm" method="POST" action="">
                        <div class="inputBox">
                            <input type="email" name="email" placeholder="Email" required>
                        </div>
                        <div class="inputBox">
                            <input type="password" name="password" placeholder="Password" required>
                        </div>
                        <button type="submit" name="login" class="submit-btn">Login</button>
                        <?php if ($loginMessage): ?>
                            <div class="error-message"><?php echo $loginMessage; ?></div>
                        <?php endif; ?>
                    </form>
                    <p class="toggle">Belum punya akun? <a href="#" onclick="toggleForm()">Daftar disini</a></p>
                </div>
            </div>
        </div>

        <!-- Register Section -->
        <div class="form-container register-container">
            <div class="form-section">
                <div class="form">
                    <h2>Create Account</h2>
                    <form id="registerForm" method="POST" action="">
                        <div class="inputBox">
                            <input type="text" name="username" placeholder="Nama Lengkap" required>
                        </div>
                        <div class="inputBox">
                            <input type="email" name="email" placeholder="Email" required>
                        </div>
                        <div class="inputBox">
                            <input type="password" name="password" placeholder="Password" required>
                        </div>
                        <div class="inputBox">
                            <input type="password" name="confirmPassword" placeholder="Konfirmasi Password" required>
                        </div>
                        <button type="submit" name="register" class="submit-btn">Register</button>
                        <?php if ($registerMessage): ?>
                            <div class="error-message"><?php echo $registerMessage; ?></div>
                        <?php endif; ?>
                    </form>
                    <p class="toggle">Sudah punya akun? <a href="#" onclick="toggleForm()">Login disini</a></p>
                </div>
            </div>
            <div class="image-section">
                <img src="../img/logo.png" alt="Register Image">
            </div>
        </div>
    </div>

    <script>
        function toggleForm() {
            const container = document.querySelector('.container');
            container.classList.toggle('register-mode');
        }
    </script>
</body>
</html>
