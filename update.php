<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id = $_POST['id'];
    $title = $_POST['title'];
    $author = $_POST['author'];

    // Ganti "id" di WHERE dengan nama kolom sebenarnya: "BookID"
    $stmt = $conn->prepare("UPDATE books SET title = :title, author = :author WHERE BookID = :id");
    $stmt->bindParam(':id', $id);
    $stmt->bindParam(':title', $title);
    $stmt->bindParam(':author', $author);

    if ($stmt->execute()) {
        echo "<script>alert('Book updated successfully!'); window.location.href='read.php';</script>";
    } else {
        echo "<script>alert('Error updating book.');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="style.css">
    <title>Update Book</title>
    <style>
        header h1 {
            text-align: center;
            color: white;
        }
        .container {
            width: 400px;
            margin: auto;
            margin-top: 30px;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Update Book</h1>
    </header>
    <div class="container">
        <form method="post">
            <input type="number" name="id" placeholder="Book ID" required>
            <input type="text" name="title" placeholder="New Book Title" required>
            <input type="text" name="author" placeholder="New Author Name" required>
            <input type="submit" value="Update Book">
        </form>
    </div>
</body>
</html>
