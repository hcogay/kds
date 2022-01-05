<?php

include("baglanti.php");

?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atık Takip Sistemi</title>
    <script src="https://kit.fontawesome.com/a5b79aa194.js" crossorigin="anonymous"></script>
    <script src="https://rawgit.com/moment/2.2.1/min/moment.min."></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
    

    
</head>
<body>
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <a href="index.php">
                        <span class="icon"><i class="fas fa-dumpster"></i></span>
                        <span class="title"><h2>Atık takip sistemi</h2></span>
                    </a>
                </li>
                <li>
                    <a href="index.php">
                        <span class="icon"><i class="fas fa-chart-area"></i></span>
                        <span class="title">Yönetici Arayüzü</span>
                    </a>
                </li>
                <li>
                    <a href="araba1.php">
                        <span class="icon"><i class="fa fa-car" aria-hidden="true"></i></span>
                        <span class="title">Araçlar</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fa fa-commenting-o" aria-hidden="true"></i></span>
                        <span class="title">Şikayetler</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fa fa-info" aria-hidden="true"></i></span>
                        <span class="title">Yardım</span>
                    </a>
                </li>
                <li>
                    <a href="giris.php">
                        <span class="icon"><i class="fa fa-sign-out" aria-hidden="true"></i></span>
                        <span class="title">Çıkış Yap</span>
                    </a>   
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fa fa-key" aria-hidden="true"></i></span>
                        <span class="title">Şifreler</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="icon"><i class="fa fa-cogs" aria-hidden="true"></i></span>
                        <span class="title">Ayarlar</span>
                    </a>
                </li>
            </ul>
        </div>




        <div class="main">
            <div class="topbar"> 
                <div class="toggle" onclick="toggleMenu();"></div>
                <div class="search">
                    <label>
                        <input type="text" placeholder="Arayın">
                        <i class="fas fa-search"></i>
                    </label>
                </div>
                <div class="user">
                    <img src="img/user.jpg" alt="">
                </div>
            </div>
            <div class="cardBox">
                <div class="card">
                    <div>
                        <div class="numbers">17</div>
                        <div class="cardName">Mutlu Mahalle</div>
                    </div>
                    <div class="iconBox">
                        <i class="fas fa-smile-beam"></i>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">26</div>
                        <div class="cardName">Aktif Araç Sayısı</div>
                    </div>
                    <div class="iconBox">
                        <i class="fa fa-car" aria-hidden="true"></i>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">5</div>
                        <div class="cardName">Aktif Çalışan Sayısı</div>
                    </div>
                    <div class="iconBox">
                        <i class="far fa-user"></i>
                    </div>
                </div>
                <div class="card">
                    <div>
                        <div class="numbers">214</div>
                        <div class="cardName">Çöp Kutusu Sayısı</div>
                    </div>
                    <div class="iconBox">
                        <i class="fas fa-dumpster"></i>
                    </div>
                </div>
            </div>
            
            <div class="graphBox">
                <div class="box">
                    <canvas id="myChart"></canvas>
                </div>
                <div class="box">
                    <Canvas id="numberofvehicles"></Canvas>
                </div>       
                

            </div>




            <div class="details">
                <div class="process">
                    <div class="cardHeader">
                        <h2>Son İşlemler</h2>
                        <a href="#" class="btn">Hepsini Gör</a>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <td>İlgili Mahalle</td>
                                <td>Çöp Kutusu Sayısı</td>
                                <td>İlgili Yetkili</td>
                                <td>Son Durum</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Barış Mah.</td>
                                <td>Yeterli </td>
                                <td>Ahmet Demir </td>
                                <td><span class="light green">Yeşil</span></td>
                            </tr>
                            <tr>
                                <td>Adatepe Mah.</td>
                                <td>Yeterli</td>
                                <td>Nihat Topçu </td>
                                <td><span class="light green">Yeşil</span></td>
                            </tr>
                            <tr>
                                <td>Atatürk Mah.</td>
                                <td>Yetersiz</td>
                                <td>Hüseyin Taç</td>
                                <td><span class="light red">Kırmızı</span></td>
                            </tr>
                            <tr>
                                <td>Kuruçeşme Mah.</td>
                                <td>İşlemde</td>
                                <td>Mehmet Sarı</td>
                                <td><span class="light blue">Mavi</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="driver">
                    <div class="cardHeader">
                        <h2>Güncel Sürücüler</h2>
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td width="60px"><div class="imgBx"><img src="img/img1.jpg"></div></td>
                                <td><h4>Hasan<br><span>Adatepe Mah</span></h4></td>
                            </tr>
                            <tr>
                                <td width="60px"><div class="imgBx"><img src="img/img2.jpg"></div></td>
                                <td><h4>Mehmet<br><span>Atatürk Mah</span></h4></td>
                            </tr>
                            <tr>
                                <td width="60px"><div class="imgBx"><img src="img/img3.jpg"></div></td>
                                <td><h4>Engin<br><span>Kuruçeşme Mah</span></h4></td>
                            </tr>
                            <tr>
                                <td width="60px"><div class="imgBx"><img src="img/img4.jpg"></div></td>
                                <td><h4>Bedirhan<br><span>Barış Mah</span></h4></td>
                            </tr>
                            <tr>
                                <td width="60px"><div class="imgBx"><img src="img/img5.jpg"></div></td>
                                <td><h4>Baran<br><span>Akıncılar Mah</span></h4></td>
                            </tr>
                            <tr>
                                <td width="60px"><div class="imgBx"><img src="img/img6.jpg"></div></td>
                                <td><h4>Gürkan<br><span>Buca Koop Mah</span></h4></td>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
<?php



//sorgu

$sql = $baglan->query("select mahalle.mahalle_ad as mahalle_ad,count(cop_kutusu.cop_kutusu_id) as sayi from mahalle inner join cop_kutusu on mahalle.mahalle_id = cop_kutusu.mahalle_id group by cop_kutusu.mahalle_id");

$a = 0; 
foreach ($sql as $r)
{
    $a++;
    $mahalle[$a] = $r["mahalle_ad"];
    $copkutusu[$a] = $r{"sayi"};
}



$sondeger = $a;

?>

    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.0/dist/chart.min.js"></script>

    <script >
    
var ctx = document.getElementById('myChart').getContext('2d');
var numberofvehicles = document.getElementById('numberofvehicles').getContext('2d');

var myChart = new Chart(ctx, {
    type: 'polarArea',
    data: {
        labels: [
            <?php
            for ($x=1;$x<=$sondeger;$x++)
            {
                echo "'".$mahalle[$x]."'";
                if ($x!=$sondeger) echo ",";
            }
            ?>

        ],
        datasets: [{
            label: 'Güncel Çöp Kutusu Sayıları (Mahalle Bazlı)',
            data: [
            <?php
            for ($x=1;$x<=$sondeger;$x++)
            {
                echo $copkutusu[$x];
                if ($x!=$sondeger) echo ",";
            }
            ?>
            ],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
    }
});




var numberofvehicles = new Chart(numberofvehicles, {
    type: 'bar',
    data: {
        labels: ['Ön Yükleme', 'Arka Yükleme', 'Yan Yükleme', 'Havalı Yükleme', 'Kepçe ile Yükleme'],
        datasets: [{
            label: 'Güncel Araç Sayısı',
            data: [6, 19, 3, 5, 2],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
    }
});

</script>
    <script>
        function toggleMenu(){
            let toggle = document.querySelector('.toggle');
            let navigation = document.querySelector('.navigation');
            let main = document.querySelector('.main');
            toggle.classList.toggle('active');
            navigation.classList.toggle('active');
            main.classList.toggle('active');
        }
    </script>
</body>

</html>