<?php 

function homeIndex() {
    $products = listAll('products');

    require_once PATH_VIEW . 'home.php';
}