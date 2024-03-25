<?php 

function updateQuantityByCartIDAndProductID($cartID, $productID, $quantity) {
    try {
        $sql = "
            UPDATE cart_items 
            SET quantity = :quantity 
            WHERE cart_id = :cart_id AND product_id = :product_id;
        ";
        
        $stmt = $GLOBALS['conn']->prepare($sql);

        $stmt->bindParam(":quantity", $quantity);
        $stmt->bindParam(":cart_id", $cartID);
        $stmt->bindParam(":product_id", $productID);

        $stmt->execute();
    } catch (\Exception $e) {
        debug($e);
    }
}

function deleteCartItemByCartIDAndProductID($cartID, $productID) {
    try {
        $sql = "
            DELETE FROM cart_items 
            WHERE cart_id = :cart_id AND product_id = :product_id;
        ";
        
        $stmt = $GLOBALS['conn']->prepare($sql);

        $stmt->bindParam(":cart_id", $cartID);
        $stmt->bindParam(":product_id", $productID);

        $stmt->execute();
    } catch (\Exception $e) {
        debug($e);
    }
}

function deleteCartItemByCartID($cartID) {
    try {
        $sql = "
            DELETE FROM cart_items 
            WHERE cart_id = :cart_id;
        ";
        
        $stmt = $GLOBALS['conn']->prepare($sql);

        $stmt->bindParam(":cart_id", $cartID);

        $stmt->execute();
    } catch (\Exception $e) {
        debug($e);
    }
}