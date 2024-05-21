import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:word_wise/chooseLevel.dart';
import 'package:word_wise/main.dart';
import 'package:word_wise/splashScreen.dart';

import 'homeScreen.dart';

void main() => runApp(LoginScreen());

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
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
                  left: -128.9,
                  top: -221,
                  child: SizedBox(
                    width: 178,
                    height: 172,
                    child: SvgPicture.network(
                      'assets/vectors/Unknown',
                    ),
                  ),
                ),
                Positioned(
                  right: -118.9,
                  top: 636,
                  child: SizedBox(
                    width: 178,
                    height: 172,
                    child: SvgPicture.network(
                      'assets/vectors/Unknown',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(39.9, 100, 39.9, 179), // Adjusted top padding for logo
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 19.6),
                        child: Image.asset(
                          'assets/loginicon.png', // Logo asset path
                          width: 200,
                          height: 200,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 20),
                        child: Text(
                          'Giriş Yap',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 61),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Her gün seviyene uygun hikayelerle dil becerilerini geliştir, sorularla bilgini test et, ve adım adım ilerle!',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 30),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x800ABBFF)),
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xCCFBFBFB),
                        ),
                        child: Container(
                          width: 303,
                          padding: EdgeInsets.fromLTRB(0, 12, 116.8, 10),
                          child: Text(
                            'Kullanıcı Adı',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color(0xBF000000),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 46),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x800ABBFF)),
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xCCFBFBFB),
                        ),
                        child: Container(
                          width: 303,
                          padding: EdgeInsets.fromLTRB(0, 12, 173.2, 10),
                          child: Text(
                            'Parola',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color(0xBF000000),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 19),
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
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.fromLTRB(1, 9, 0, 7),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChooseLevel()));
                          },
                          child: Container(
                            width: 303,
                            child: Text(
                              'Giriş Yap',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Color(0xFFFFFFFF),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 6.6, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 7.7, 0),
                              child: Text(
                                'Hesabın mevcut değil mi?',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            Text(
                              'Kayıt Ol',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Color(0xFF0ABBFF),
                              ),
                            ),
                          ],
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
