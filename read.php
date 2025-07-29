<?php
include 'db.php';

try {
    $stmt = $conn->prepare("SELECT * FROM books");
    $stmt->execute();
    $books = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Error: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Books List</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .table-container {
            max-width: 95%;
            margin: 30px auto;
            overflow-x: auto;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        thead {
            background-color: #2c3e50;
            color: white;
        }

        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
        }

        h1 {
            text-align: center;
            margin-top: 30px;
            font-size: 28px;
            color: white;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-content">
            <h1>📚 Books List</h1>
        </div>
    </header>

    <div class="table-container">
        <?php if (count($books) > 0): ?>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Publisher</th>
                        <th>Publication Date</th>
                        <th>ISBN</th>
                        <th>Price</th>
                        <th>Genre</th>
                        <th>Stock</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($books as $book): ?>
                        <tr>
                            <td><?= htmlspecialchars($book['BookID']) ?></td>
                            <td><?= htmlspecialchars($book['Title']) ?></td>
                            <td><?= htmlspecialchars($book['Author']) ?></td>
                            <td><?= htmlspecialchars($book['Publisher']) ?></td>
                            <td><?= htmlspecialchars($book['PublicationDate']) ?></td>
                            <td><?= htmlspecialchars($book['ISBN']) ?></td>
                            <td><?= htmlspecialchars($book['Price']) ?></td>
                            <td><?= htmlspecialchars($book['Genre']) ?></td>
                            <td><?= htmlspecialchars($book['AvailableStock']) ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p style="text-align:center;">No books found in the database.</p>
        <?php endif; ?>
    </div>
</body>
</html>
