<?php

function orderCheckout()
{
    require_once PATH_VIEW . 'order.php';
}

function orderPurchase()
{
    if (!empty($_POST) && !empty($_SESSION['cart'])) {
        try {
            // Xử lý lưu vào bảng orders và order_items
            $data = $_POST;
            $data['user_id']            = $_SESSION['user']['id'];
            $data['total_bill']         = caculator_total_order(false);
            $data['status_delivery']    = STATUS_DELIVERY_WFC;
            $data['status_payment']     = STATUS_PAYMENT_UNPAID;

            $orderID = insert_get_last_id('orders', $data);

            foreach ($_SESSION['cart'] as $productID => $item) {
                $orderItem = [
                    'order_id'      => $orderID,
                    'product_id'    => $productID,
                    'quantity'      => $item['quantity'],
                    'price'         => $item['price_sale'] ?: $item['price_regular'],
                ];

                insert('order_items', $orderItem);
            }

            // Xử lý hậu
            deleteCartItemByCartID($_SESSION['cartID']);
            delete2('carts', $_SESSION['cartID']);

            unset($_SESSION['cart']);
            unset($_SESSION['cartID']);
        } catch (\Exception $e) {
            debug($e);
        }

        header('Location: ' . BASE_URL . '?act=order-success');
        exit();
    }

    header('Location: ' . BASE_URL);
}

function orderSuccess()
{
    require_once PATH_VIEW . 'order-success.php';
}
