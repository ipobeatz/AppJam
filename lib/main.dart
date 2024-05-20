import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:word_wise/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    setState(() {
      // Counter logic here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  left: -120.1,
                  top: -103,
                  child: SizedBox(
                    width: 178,
                    height: 172,
                    child: SvgPicture.network(
                      'assets/vectors/Unknown',
                    ),
                  ),
                ),
                Positioned(
                  right: -106.1,
                  top: 754,
                  child: SizedBox(
                    width: 178,
                    height: 172,
                    child: SvgPicture.network(
                      'assets/vectors/Unknown',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(31.1, 56, 27.1, 77),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 4, 23),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'assets/images/ogrenio.png',
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(10, 4),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Container(
                          width: 306,
                          height: 315,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 23),
                        child: Text(
                          'Yeni Bir Dil, Yeni Bir Dünya: Kolayca Öğren, Hızla Keşfet!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(6.5, 0, 10.5, 58),
                        child: Text(
                          'OGRENIO ile İngilizce öğrenmek artık çok daha eğlenceli ve etkili! Günlük olarak seviyenize uygun 3 adet İngilizce hikaye ile dil becerilerinizi geliştirin. Her hikayeden sonra gelen sorularla bilginizi test edin ve ilerlemenizi gözlemleyin. Seviye seviye ilerleyerek İngilizceyi hızla ve kalıcı bir şekilde öğrenin. OGRENIO ile yeni bir dil, yeni bir dünya keşfedin!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFF0ABBFF),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 4),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(29.9, 9, 29.9, 7),
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                           Navigator.of(context).push(MaterialPageRoute(
                               builder: (context)=> Login()));

                          },
                          child: Text(
                            'HAYDİ BAŞLAYALIM!',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
