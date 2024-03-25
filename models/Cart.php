<?php 

function getCartID($userID) {
    // Lấy dữ liệu trong DB
    $cart = getCartByUserID($userID);

    if (empty($cart)) {
        return insert_get_last_id('carts', [
            'user_id' => $userID
        ]);
    }

    return $cart['id'];
}

function getCartByUserID($userID) {
    try {
        $sql = "SELECT * FROM carts WHERE user_id = :user_id LIMIT 1";

        $stmt = $GLOBALS['conn']->prepare($sql);

        $stmt->bindParam(":user_id", $userID);

        $stmt->execute();

        return $stmt->fetch();
    } catch (\Exception $e) {
        debug($e);
    }
}