<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách giỏ hàng</title>

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <div class="container">
        <div class="row">
            <h1>Danh sách giỏ hàng</h1>

            <table class="table">
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Xóa</th>
                </tr>


                <?php
                if (!empty($_SESSION['cart'])) :
                    foreach ($_SESSION['cart'] as $item) : ?>
                        <tr>
                            <th>
                                <img src="<?= BASE_URL . $item['img_thumbnail'] ?>" width="50px" alt="">
                            </th>
                            <th><?= $item['name'] ?></th>
                            <th><?= number_format($item['price_sale'] ?: $item['price_regular']) ?></th>
                            <th>
                                <a href="<?= BASE_URL . '?act=cart-dec&productID=' . $item['id'] ?>" class="btn btn-danger">-</a>

                                <span class="btn btn-warning"><?= $item['quantity'] ?></span>

                                <a href="<?= BASE_URL . '?act=cart-inc&productID=' . $item['id'] ?>" class="btn btn-success">+</a>
                            </th>
                            <th>
                                <?php 
                                    $total = ($item['price_sale'] ?: $item['price_regular']) * $item['quantity'];

                                    echo number_format($total);
                                ?>
                            </th>
                            <th>
                                <a href="<?= BASE_URL . '?act=cart-del&productID=' . $item['id'] ?>" onclick="return confirm('có chắc xóa không')" class="btn btn-danger">Xóa</a>
                            </th>
                        </tr>
                <?php
                    endforeach;
                endif;
                ?>

            </table>
            
            <a href="<?= BASE_URL . '?act=order-checkout' ?>" class="btn btn-info mt-5">Checkout</a>
        </div>
    </div>
</body>

</html>