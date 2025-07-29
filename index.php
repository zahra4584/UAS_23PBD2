<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bookstore</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef5fa;
        }

        header {
            background-color: #2c3e50;
            padding: 30px 0;
            text-align: center;
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        header h1 {
            font-size: 36px;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        header h1 i {
            font-size: 28px;
            color: #78e08f;
        }

        header p {
            margin: 5px 0 0;
            font-size: 16px;
            color: #ccc;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 60vh;
        }

        .card {
            background-color: white;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .card h2 {
            margin-bottom: 30px;
            font-size: 24px;
            color: #333;
        }

        .buttons a {
            display: inline-block;
            margin: 10px;
            padding: 12px 25px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s ease;
        }

        .buttons a:hover {
            background-color: #2980b9;
        }

        .buttons a i {
            margin-right: 8px;
        }
    </style>
</head>
<body>

<header>
    <h1><i class="fas fa-book-open-reader"></i> Welcome to Our Bookstore</h1>
    <p>Temukan buku terbaik untuk hari ini!</p>
</header>

<div class="container">
    <div class="card">
        <h2>Manage Books</h2>
        <div class="buttons">
            <a class="button-link" href="create.php">➕ Add New Book</a>
            <a class="button-link" href="read.php">📖 View Books</a>
            <a class="button-link" href="update.php">✏️ Update Book</a>
            <a class="button-link" href="delete.php">🗑️ Delete Book</a>
        </div>
    </div>
</div>

</body>
</html>
