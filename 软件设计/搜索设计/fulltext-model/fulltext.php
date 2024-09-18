<?php
// Database connection
$host = 'localhost';
$port = '5432';
$dbname = 'postgres';
$user = 'postgres';
$password = '123456';

$dsn = "pgsql:host=$host;port=$port;dbname=$dbname";
try {
    $pdo = new PDO($dsn, $user, $password);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
    exit();
}

// Handle content addition
if (isset($_POST['add_content'])) {
    $text = $_POST['text'];
    $stmt = $pdo->prepare("INSERT INTO content (text) VALUES (:text)");
    $stmt->execute(['text' => $text]);
    echo "Content added successfully!";
}

// Handle content search
$search_results = [];
if (isset($_POST['search'])) {
    $query = $_POST['query'];
    $stmt = $pdo->prepare("SELECT * FROM content WHERE text ILIKE :query");
    $stmt->execute(['query' => "%$query%"]);
    $search_results = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Content Search</title>
</head>
<body>
<h1>添加</h1>

<!-- Add content -->
<form method="post" action="">
<!--    <h2>添加</h2>-->
    <textarea name="text" rows="4" cols="50" required></textarea><br>
    <input type="submit" name="add_content" value="添加">
</form>

<!-- Search content -->
<form method="post" action="">
    <h2>搜索</h2>
    <input type="text" name="query" required>
    <input type="submit" name="search" value="搜索">
</form>

<!-- Display search results -->
<?php if (!empty($search_results)): ?>
    <h2>结果</h2>
    <ul>
        <?php foreach ($search_results as $result): ?>
            <li><?php echo htmlspecialchars($result['text']); ?></li>
        <?php endforeach; ?>
    </ul>
<?php endif; ?>
</body>
</html>
