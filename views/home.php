<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <div class="container">
        <div class="row">
            <h1>Đây là trang chủ</h1>

            <?php foreach ($products as $product) : ?>
                <div class="col-md-3 mb-3">
                    <div class="card">
                        <img class="card-img-top img-responsive" height="300px" src="<?= BASE_URL . $product['img_thumbnail'] ?>">
                        <div class="card-body">
                            <h4 class="card-title"><?= $product['name'] ?></h4>
                            <p class="card-text"><?= $product['overview'] ?></p>
                            <a href="#" class="btn btn-primary">Add to cart</a>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>

        </div>
    </div>
</body>

</html>