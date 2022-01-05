<?php
include("baglanti.php");
session_start();
if($baglan){
if($_POST["eposta"]){
    $eposta=strip_tags(trim($_POST["eposta"]));
}else{
    echo "Eposta gelmedi";
}    
if($_POST["sifre"]){
   $sifre=strip_tags(trim($_POST["sifre"]));
}else{
   echo "Sifre gelmedi";
}
$kullaniciSorgu= mysqli_query($baglan,"SELECT * FROM kullanicilar WHERE eposta='" . $eposta ."' AND sifre='" . $sifre . "' ");
        if (mysqli_num_rows($kullaniciSorgu)>0){
            $row = $kullaniciSorgu->fetch_array(MYSQLI_ASSOC);
            $_SESSION['adSoyad']=$row{'Kullanici_adi'};
            $_SESSION['eposta']=$row['eposta'];
            echo 1;
        }else{
            echo "Kullanıcı adı veya şifresi hatalı";
        }

}else{
die("Bağlantı Sağlanamadı");
}

?>