<?php
// 1. Check if an ID was passed in the URL
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    die("Invalid vehicle ID.");
}

$car_id = $_GET['id'];

// 2. Database Connection (Using your MAMP credentials)
$host     = 'localhost'; 
$db       = 'phpbook-1'; 
$user     = 'root';      
$password = 'root';      
$charset  = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $password, $options);
} catch (\PDOException $e) {
    die("Database connection failed.");
}

// 3. Fetch the Specific Car using a PREPARED STATEMENT (Security best practice!)
$sql = "SELECT a.*, 
               c.name AS category_name, 
               i.file AS image_file, i.alt AS image_alt,
               m.forename, m.surname, m.email
        FROM article a
        LEFT JOIN category c ON a.category_id = c.id
        LEFT JOIN image i ON a.image_id = i.id
        LEFT JOIN member m ON a.member_id = m.id
        WHERE a.id = :id AND a.published = 1";

$stmt = $pdo->prepare($sql);
$stmt->execute(['id' => $car_id]);
$car = $stmt->fetch();

// If no car is found with that ID, stop the script
if (!$car) {
    die("Vehicle not found or is no longer available.");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($car['title']) ?> - Fast Dealership</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container">
            <a class="navbar-brand" href="index.php">🚗 Fast Dealership</a>
        </div>
    </nav>

    <div class="container mb-5">
        <div class="row">
            <div class="col-md-8">
                <?php if ($car['image_file']): ?>
                    <img src="pictures/<?= htmlspecialchars($car['image_file']) ?>" 
                         class="img-fluid rounded shadow-sm mb-3 w-100" 
                         alt="<?= htmlspecialchars($car['image_alt']) ?>">
                <?php else: ?>
                    <div class="bg-secondary text-white d-flex align-items-center justify-content-center rounded shadow-sm mb-3" style="height: 400px;">
                        <h3>No Image Available</h3>
                    </div>
                <?php endif; ?>
            </div>

            <div class="col-md-4">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.php">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page"><?= htmlspecialchars($car['category_name']) ?></li>
                    </ol>
                </nav>

                <h1 class="h2"><?= htmlspecialchars($car['title']) ?></h1>
                <p class="lead text-muted"><?= htmlspecialchars($car['summary']) ?></p>
                
                <hr>
                
                <h4>Description</h4>
                <p><?= nl2br(htmlspecialchars($car['content'])) ?></p>

                <div class="card mt-4 border-0 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Dealer Information</h5>
                        <p class="mb-1"><strong>Agent:</strong> <?= htmlspecialchars($car['forename'] . ' ' . $car['surname']) ?></p>
                        <p class="mb-1"><strong>Email:</strong> <a href="mailto:<?= htmlspecialchars($car['email']) ?>"><?= htmlspecialchars($car['email']) ?></a></p>
                        <p class="mb-0 text-muted small">Listed on: <?= date('F j, Y', strtotime($car['created'])) ?></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
<footer class="site-footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <h5 class="text-white mb-3">🚗 Fast Dealership</h5>
                    <p class="text-muted small">
                        Providing high-quality vehicles with unbeatable performance. Whether you need a daily commuter or a track-ready monster, your dream car awaits.
                    </p>
                </div>

                <div class="col-md-4 mb-4">
                    <h5 class="text-white mb-3">Quick Links</h5>
                    <ul class="list-unstyled small">
                        <li class="mb-2"><a href="index.php" class="footer-link">View Inventory</a></li>
                        <li class="mb-2"><a href="#" class="footer-link">Financing Options</a></li>
                        <li class="mb-2"><a href="#" class="footer-link">About Our Team</a></li>
                    </ul>
                </div>

                <div class="col-md-4 mb-4">
                    <h5 class="text-white mb-3">Contact Us</h5>
                    <ul class="list-unstyled small text-muted">
                        <li class="mb-2">📍 1327 Quarter Mile Street</li>
                        <li class="mb-2">📞 (555) 867-5309</li>
                        <li class="mb-2">✉️ dom@fastdealership.link</li>
                    </ul>
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-12 text-center text-muted small border-top border-secondary pt-3" style="border-color: #334155 !important;">
                    &copy; <?= date('Y') ?> Fast Dealership. All rights reserved.
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
</body>
</html>