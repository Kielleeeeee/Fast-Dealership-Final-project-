<?php
require 'db.php';

$category_filter = null;
if (isset($_GET['category']) && is_numeric($_GET['category'])) {
    $category_filter = $_GET['category'];
}

$sql = "SELECT a.id, a.title, a.summary, a.created, 
               c.name AS category_name, 
               i.file AS image_file, i.alt AS image_alt,
               m.forename, m.surname
        FROM article a
        LEFT JOIN category c ON a.category_id = c.id
        LEFT JOIN image i ON a.image_id = i.id
        LEFT JOIN member m ON a.member_id = m.id
        WHERE a.published = 1";
if ($category_filter) {
    $sql .= " AND a.category_id = :cat_id";
}
$sql .= " ORDER BY a.created DESC";
$art_stmt = $pdo->prepare($sql);

if ($category_filter) {
    $art_stmt->execute(['cat_id' => $category_filter]);
} else {
    
    $art_stmt->execute();
}
$cars = $art_stmt->fetchAll();

$page_heading = "Available Vehicles";
if ($category_filter) {
    $heading_stmt = $pdo->prepare("SELECT name FROM category WHERE id = :id");
    $heading_stmt->execute(['id' => $category_filter]);
    $cat_result = $heading_stmt->fetch();
    if ($cat_result) {
        $page_heading = $cat_result['name'];
    }
}

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
include 'footer.php'; 
?>