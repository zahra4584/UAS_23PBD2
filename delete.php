<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];

    // Ganti ke BookID
    $stmt = $conn->prepare("DELETE FROM books WHERE BookID = :id");
    $stmt->bindParam(':id', $id);

    if ($stmt->execute()) {
        echo "<script>alert('Book deleted successfully!'); window.location.href='read.php';</script>";
    } else {
        echo "<script>alert('Error deleting book.');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Book</title>
    <link rel="stylesheet" href="style.css">
    <style>
        * {
            box-sizing: border-box;
        }

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

        input[type="number"],
        input[type="submit"] {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #c0392b;
            color: white;
            border: none;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #992d22;
        }
    </style>
</head>
<body>
    <header>
        <h1>Delete Book</h1>
    </header>
    <div class="container">
        <form method="post">
            <input type="number" name="id" placeholder="Book ID" required>
            <input type="submit" value="Delete Book">
        </form>
    </div>
</body>
</html>
