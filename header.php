<?php

$cat_stmt = $pdo->query("SELECT * FROM category WHERE navigation = 1 ORDER BY name ASC");
$categories = $cat_stmt->fetchAll();
?>
<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fast Dealership</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container">
            <a class="navbar-brand" href="index.php">
    <img src="pictures/logo.svg" alt="Fast Dealership Logo" height="40">
</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <?php foreach ($categories as $cat): ?>
                        <li class="nav-item">
                            <a class="nav-link" href="index.php?category=<?= htmlspecialchars($cat['id']) ?>">
                                <?= htmlspecialchars($cat['name']) ?>
                            </a>
                        </li>
                    <?php endforeach; ?>
                </ul>
            </div>
        </div>
    </nav>