import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Üstteki büyük fotoğraf
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 209,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.4), // %40 saydamlık
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/profilarka.jpg'), // Profil arka planı
                      fit: BoxFit.cover,
                      opacity: 0.4,
                    ),
                  ),
                ),
                Positioned(
                  top: 100, // Fotoğrafın üst kısmı için konumlandırma
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFF0abbff), // Border rengi
                        width: 3,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/kullaniciprofilfoto.jpg'), // Profil fotoğrafı
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 70), // Fotoğraf ile isim arasında boşluk

            // Kullanıcı ismi
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Text(
                'Kullanıcı Adı', // Örnek kullanıcı adı
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 30),

            // İSTATİSTİKLER başlığı
            Text(
              'İSTATİSTİKLER',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            // İstatistik kartları
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  // İlk satır
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // Çözülen Sorular
                      _buildStatCard(
                        icon: Icons.question_answer,
                        title: 'Çözülen Sorular',
                        value: '42', // Örnek veri
                      ),
                      // Dil Seviyesi
                      _buildStatCard(
                        icon: Icons.language,
                        title: 'Dil Seviyesi',
                        value: 'B2', // Örnek veri
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // İkinci satır
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      // Doğru Cevap
                      _buildStatCard(
                        icon: Icons.check_circle,
                        title: 'Doğru Cevap',
                        value: '35', // Örnek veri
                      ),
                      // Yanlış Cevap
                      _buildStatCard(
                        icon: Icons.cancel,
                        title: 'Yanlış Cevap',
                        value: '7', // Örnek veri
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // İstatistik kartı widget'ı
  Widget _buildStatCard(
      {required IconData icon, required String title, required String value}) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 170, // Genişlik
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(icon, size: 20, color: Colors.black),
              SizedBox(width: 10),
              Text(
                value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
