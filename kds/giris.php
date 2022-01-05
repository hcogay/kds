<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style.css" type="text/css" rel="stylesheet">
    <title>Giriş</title>
    <script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"></script>
</head>

<script type="text/javascript">
    $(document).ready(function(){
        $("#giris").click(function(){
          $.post("kontrol.php",
                      {
                          sifre: $("#sifre").val(),
                          eposta:$("#eposta").val()
                      },
                      function(data,status){
                      if(data!=1){
                        alert("Kullanıcı adınız veya şifreniz yanlış");
                      }else{
                        $(location).attr('href', 'index.php');
                      }
                      });
          
        });
    });
  </script>
<body>
    <div class="icerik1" > 
        <from  class="formicerik">
            <div class="yazi">YÖNETİCİ GİRİŞİ</div>
            <div class="form">
                <input type="email" class="form-kontrol" id="eposta" name="eposta" placeholder="E-postanız">
            </div>
            <div class="form">
                <input type="password" class="form-kontrol" id="sifre" name="sifre" placeholder="Şifreniz">
            </div> 
            <button type="submit" name="giris" id="giris" class="gir">Giriş Yap</button>         
        </form>
    </div>
</body>
</html>