<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt hàng</title>

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
    <div class="container">
        <form action="<?= BASE_URL . '?act=order-purchase' ?>" method="POST">
            <div class="row">
                <h1>Đặt hàng</h1>

                <div class="col-md-6">
                    <div class="mt-2 mb-2">
                        <label for="user_name">Name</label>
                        <input type="text" name="user_name" id="user_name" value="<?= $_SESSION['user']['name'] ?>" required class="form-control">
                    </div>
                    <div class="mt-2 mb-2">
                        <label for="user_email">Email</label>
                        <input type="email" name="user_email" id="user_email" value="<?= $_SESSION['user']['email'] ?>" required class="form-control">
                    </div>
                    <div class="mt-2 mb-2">
                        <label for="user_phone">Phone</label>
                        <input type="tel" name="user_phone" id="user_phone" required class="form-control">
                    </div>
                    <div class="mt-2 mb-2">
                        <label for="user_address">Address</label>
                        <input type="text" name="user_address" id="user_address" required class="form-control">
                    </div>
                </div>

                <div class="col-md-6">
                    <table class="table">
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
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
                                        <span class="btn btn-warning"><?= $item['quantity'] ?></span>
                                    </th>
                                    <th>
                                        <?php
                                        $total = ($item['price_sale'] ?: $item['price_regular']) * $item['quantity'];

                                        echo number_format($total);
                                        ?>
                                    </th>
                                </tr>
                        <?php
                            endforeach;
                        endif;
                        ?>

                    </table>

                    <h2>Xác nhận thanh toán</h2>
                    <h3>
                        Tổng tiền: 

                        <?= caculator_total_order() ?>
                    </h3>
                    <a href="<?= BASE_URL ?>" 
                        onclick="return !confirm('Đừng đi :))')"
                        class="btn btn-warning"> Quay lại trang chủ</a>

                    <button type="submit" class="btn btn-success">Đặt mua</button>
                </div>

            </div>
        </form>
    </div>
</body>

</html>