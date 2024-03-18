<?php 

function authenShowFormLogin() {
    if ($_POST) {
        authenLogin();
    }

    require_once PATH_VIEW . 'authen/login.php';
}

function authenLogin() {
    $user = getUserClientByEmailAndPassword($_POST['email'], $_POST['password']);

    if (empty($user)) {
        $_SESSION['error'] = 'Email hoặc password chưa đúng!';

        header('Location: ' . BASE_URL . '?act=login');
        exit();
    }

    $_SESSION['user'] = $user;

    header('Location: ' . BASE_URL);
    exit();
}

function authenLogout() {
    if (!empty($_SESSION['user'])) {
        session_destroy();
    }

    header('Location: ' . BASE_URL);
    exit();
}