<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = $_POST['title'];
    $author = $_POST['author'];
    
    $stmt = $conn->prepare("INSERT INTO books (title, author) VALUES (:title, :author)");
    $stmt->bindParam(':title', $title);
    $stmt->bindParam(':author', $author);
    
    if ($stmt->execute()) {
        echo "<script>alert('New book added successfully!'); window.location.href='read.php';</script>";
    } else {
        echo "<script>alert('Error adding book.');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add New Book</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        header {
            background-color: #2c3e50;
            padding: 20px 0;
            text-align: center;
        }

        header h1 {
            color: white;
            margin: 0;
            font-size: 32px;
        }

        .container {
            max-width: 500px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input[type="text"], input[type="submit"] {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #2c3e50;
            color: white;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1a252f;
        }
    </style>
</head>
<body>
    <header>
        <h1>Add New Book</h1>
    </header>
    <div class="container">
        <form method="post">
            <input type="text" name="title" placeholder="Book Title" required>
            <input type="text" name="author" placeholder="Author Name" required>
            <input type="submit" value="Add Book">
        </form>
    </div>
</body>
</html>
