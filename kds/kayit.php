<?php
 

include("baglanti.php");

$mah = $_POST["adi"];
$arac = $_POST["id"];
$tip = $_POST["tip"];
$sorgu = ("INSERT INTO yonetici_istek( mahalle_adi, arac_id, arac_tipi) VALUES('$mah','$arac','$tip')");
$add = @mysqli_query(baglan,sorgu);
 
if ($add)
{
    echo "Ekleme İşlemi Başarılı Bir Şekilde Gerçekleştirildi";
}
else
{
    echo "Hata";
}
 
?>