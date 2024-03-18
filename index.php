<?php 

// Require file trong commons
require_once './commons/env.php';
require_once './commons/helper.php';
require_once './commons/connect-db.php';
require_once './commons/model.php';

// Require file trong controllers và models
require_file(PATH_CONTROLLER);
require_file(PATH_MODEL);

// Điều hướng
$act = $_GET['act'] ?? '/';

// Biến này cần khai báo được link cần đăng nhập mới vào được
$arrRouteNeedAuth = [
    'user-detail', // Đây là 1 ví dụ
]; 

// Kiểm tra xem user đã đăng nhập chưa
middleware_auth_check($act, $arrRouteNeedAuth);

match($act) {
    '/' => homeIndex(),
    'user-detail' => userDetail($_GET['id']),

    // Authen
    'login' => authenShowFormLogin(),
    'logout' => authenLogout(),
};

require_once './commons/disconnect-db.php';