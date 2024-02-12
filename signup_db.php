<?php
    session_start();
    require_once 'config/db.php';

    if (isset($_POST['signup'])) {
        $firstname = $_POST['firstname'];
        $lastname = $_POST['lastname']; // แก้ไขเป็น $lastname แทน $lantname
        $email = $_POST['email'];
        $password = $_POST['password'];
        $c_password = $_POST['c_password'];
        $urole = 'user';

        if (empty($firstname)) {
            $_SESSION['error'] = 'กรุณากรอกชื่อ';
            header("location: index.php");
        } else if (empty($lastname)) {
            $_SESSION['error'] = 'กรุณากรอกนามสกุล';
            header("location: index.php");
        } else if (empty($email)) {
            $_SESSION['error'] = 'กรุณากรอก Email';
            header("location: index.php");
        } else if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $_SESSION['error'] = 'รูปแบบ Email ไม่ถูกต้อง';
            header("location: index.php");
        } else if (empty($password)) {
            $_SESSION['error'] = 'กรุณากรอก รหัสผ่าน';
            header("location: index.php");
        } else if (strlen($password) > 20 || strlen($password) < 5) { // แก้ไขเป็น $password แทน $_POST['password']
            $_SESSION['error'] = 'รหัสผ่านต้องอยู่ระหว่าง 5 ถึง 20 ตัวอักษร';
            header("location: index.php");
        } else if (empty($c_password)) {
            $_SESSION['error'] = 'กรุณายืนยัน รหัสผ่าน';
            header("location: index.php");
        } else if ($password != $c_password) {
            $_SESSION['error'] = 'รหัสผ่านไม่ตรงกัน';
            header("location: index.php");
        } else {
            try {
                $check_email = $conn->prepare("SELECT email FROM users WHERE email = :email");
                $check_email->bindParam(":email", $email);
                $check_email->execute();
                $row = $check_email->fetch(PDO::FETCH_ASSOC);

                if ($row['email'] == $email) { // แก้ไขเป็น $row['email'] แทน $row['email' == $email]
                    $_SESSION['error'] = "มี Email นี้อยู่ในระบบแล้ว <a href='signin.php'>คลิ๊กที่นี่</a> เพื่อเข้าสู่ระบบ";
                    header("location: index.php");
                } else {
                    $passwordHash = password_hash($password, PASSWORD_DEFAULT);
                    $stmt = $conn->prepare("INSERT INTO users(firstname, lastname, email, password, urole)
                                            VALUES(:firstname ,:lastname, :email, :password, :urole)");
                    $stmt->bindParam(":firstname", $firstname);
                    $stmt->bindParam(":lastname", $lastname);
                    $stmt->bindParam(":email", $email);
                    $stmt->bindParam(":password", $passwordHash);
                    $stmt->bindParam(":urole", $urole);
                    $stmt->execute();

                    $_SESSION['success'] = "สมัครสมาชิกเรียบร้อย! <a href='signin.php' class='alert-link'>คลิ๊กที่นี่เพื่อเข้าสู่ระบบ</a>";
                    header("location: index.php");
                }
            } catch (PDOException $e) {
                echo $e->getMessage();
            }
        }
    }
?>
