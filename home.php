<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/homecss.css">
  <title>ยินดีต้อนรับ</title>
</head>
<body>
  <div class="container">
    <div class="img-container">
      <img src="photo/MTB.png" class="img-fluid" alt="...">
    </div>
    <h1>ยินดีต้อนรับ</h1>
    <div class="container">
      <p>
        <a href="signin.php"><span>เข้าสู่ระบบ</span></a>
      </p>
      <p>
        <a href="index.php"><span>สมัครสมาชิก</span></a>
      </p>
      <p>
        <a href="http://localhost/Project/Homesky/index.html#"><span>HOME</span></a>
      </p>
    </div>
  </div>
  <!-- เพิ่มส่วนใหม่ -->
  <audio id="welcomeSound">
        <source src="welcome_sound.mp3" type="audio/mpeg">
    </audio>

    <script>
        document.querySelector('.welcome-text').addEventListener('click', function() {
            var audio = document.getElementById('welcomeSound');
            audio.play();
        });
    </script>
</body>
</html>
