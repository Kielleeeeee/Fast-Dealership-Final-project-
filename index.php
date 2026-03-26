<?php
// 1. Load the database connection
require 'db.php';

// 2. Check if a category was clicked in the navigation
$category_filter = null;
if (isset($_GET['category']) && is_numeric($_GET['category'])) {
    $category_filter = $_GET['category'];
}

// 3. Build the Base SQL Query
$sql = "SELECT a.id, a.title, a.summary, a.created, 
               c.name AS category_name, 
               i.file AS image_file, i.alt AS image_alt,
               m.forename, m.surname
        FROM article a
        LEFT JOIN category c ON a.category_id = c.id
        LEFT JOIN image i ON a.image_id = i.id
        LEFT JOIN member m ON a.member_id = m.id
        WHERE a.published = 1";

// 4. Add the Category Filter (if one was clicked)
if ($category_filter) {
    $sql .= " AND a.category_id = :cat_id";
}

$sql .= " ORDER BY a.created DESC";

// 5. Execute the Query Securely
$art_stmt = $pdo->prepare($sql);

if ($category_filter) {
    // Bind the ID from the URL to the query safely
    $art_stmt->execute(['cat_id' => $category_filter]);
} else {
    // No filter, just run the normal query
    $art_stmt->execute();
}

$cars = $art_stmt->fetchAll();

// 6. Optional Detail: Change the page heading dynamically
$page_heading = "Available Vehicles";
if ($category_filter) {
    $heading_stmt = $pdo->prepare("SELECT name FROM category WHERE id = :id");
    $heading_stmt->execute(['id' => $category_filter]);
    $cat_result = $heading_stmt->fetch();
    if ($cat_result) {
        $page_heading = $cat_result['name'];
    }
}

// 7. Load the Header
include 'header.php';
?>

<div class="container mb-5">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="border-bottom border-secondary pb-2"><?= htmlspecialchars($page_heading) ?></h2>
        </div>
    </div>

    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <?php foreach ($cars as $car): ?>
            <div class="col">
                <a href="car-details.php?id=<?= htmlspecialchars($car['id']) ?>" class="car-card-link">
                    <div class="card h-100 car-card">
                        <?php if ($car['image_file']): ?>
                            <img src="pictures/<?= htmlspecialchars($car['image_file']) ?>" 
                                 class="card-img-top" 
                                 alt="<?= htmlspecialchars($car['image_alt']) ?>">
                        <?php else: ?>
                            <div class="card-img-top d-flex align-items-center justify-content-center text-muted">
                                No Image Available
                            </div>
                        <?php endif; ?>

                        <div class="card-body">
                            <span class="badge bg-primary mb-2"><?= htmlspecialchars($car['category_name']) ?></span>
                            <h5 class="card-title"><?= htmlspecialchars($car['title']) ?></h5>
                            <p class="card-text text-muted"><?= htmlspecialchars($car['summary']) ?></p>
                        </div>
                        
                        <div class="card-footer small d-flex justify-content-between">
                            <span>Listed by: <?= htmlspecialchars($car['forename'] . ' ' . $car['surname']) ?></span>
                            <span><?= date('M j, Y', strtotime($car['created'])) ?></span>
                        </div>
                    </div>
                </a>
            </div>
        <?php endforeach; ?>
    </div>
</div>

<?php 
// 4. Load the Footer
include 'footer.php'; 
?>