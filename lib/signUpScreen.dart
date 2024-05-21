import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_wise/loginScreen.dart';
import 'package:word_wise/auth_services.dart';

import 'auth_services.dart';

void main() {
  runApp(const signUpScreen());
}

class signUpScreen extends StatelessWidget {
  const signUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
    setState(() {});
  }

  // SignUp Controllers
  final _auth = AuthService();

  final _email = TextEditingController();
  final _password = TextEditingController();
  final _fullname = TextEditingController();
  final _username = TextEditingController();

  // dispose after usage of controller
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _fullname.dispose();
    _username.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: -112.9,
                  top: -235,
                  child: SizedBox(
                    width: 178,
                    height: 172,
                  ),
                ),
                Positioned(
                  left: -128.9,
                  top: 638,
                  child: SizedBox(
                    width: 178,
                    height: 172,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(39.9, 93, 39.9, 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 19.6),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/logocuk.png'),
                            ),
                          ),
                          child: Container(
                            width: 60,
                            height: 57.4,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 20),
                        child: Text(
                          'Kayıt Ol',
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
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 34),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x800ABBFF)),
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xCCFBFBFB),
                        ),
                        // Full Name
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Tam Adınız',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 15),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xBF000000),
                          ),
                          // controller
                          controller: _fullname,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 34),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x800ABBFF)),
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xCCFBFBFB),
                        ),
                        // Username
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Kullanıcı Adı',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 15),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xBF000000),
                          ),
                          // controller
                          controller: _username,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 34),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x800ABBFF)),
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xCCFBFBFB),
                        ),
                        // E-Mail
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email Adresi',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 15),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xBF000000),
                          ),
                          // controller
                          controller: _email,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 34),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x800ABBFF)),
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xCCFBFBFB),
                        ),
                        // Password
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Parola',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 15),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xBF000000),
                          ),
                          // controller
                          controller: _password,
                        ),
                      ),
                      Container(
                        child: Container(
                          width: 303,
                          padding: EdgeInsets.fromLTRB(1, 4, 0, 7),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0ABBFF),
                              padding: EdgeInsets.fromLTRB(1, 9, 0, 7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: _signup,
                            child: Container(
                              width: 303,
                              child: Text(
                                'Kayıt Ol !',
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
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(2.3, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(2, 11, 0, 0),
                              child: Text(
                                'Zaten hesabınız var mı?',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: _signup,
                              child: Text(
                                'Kayıt Ol',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Color(0xFF0ABBFF),
                                ),
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

  _signup() async {
    final user =
    await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
    if (user != null) {
      print("User Created Successfully");
      // Login Screen Yönlendirmesi Yapılacak
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }
}