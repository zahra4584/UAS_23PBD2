<?php include 'db.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookstore</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <div class="header-content">
            <div>
                <h1>📚 Welcome to Our Bookstore</h1>
                <p class="tagline">Temukan buku terbaik untuk hari ini!</p>
            </div>
        </div>
    </header>

    <div class="container">
        <h2>Manage Books</h2>
        <div class="button-container">
            <a class="button-link" href="create.php">➕ Add New Book</a>
            <a class="button-link" href="read.php">📖 View Books</a>
            <a class="button-link" href="update.php">✏️ Update Book</a>
            <a class="button-link" href="delete.php">🗑️ Delete Book</a>
        </div>
    </div>

    <script src="script.js"></script>
</body>
</html>
