import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homeScreen.dart';

void main() {
  runApp(const ChooseLevel());
}

class ChooseLevel extends StatelessWidget {
  const ChooseLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Seviyeni Belirle'),
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
                Container(
                  padding: EdgeInsets.fromLTRB(40.8, 93, 40.8, 150),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 19.6),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/logo.png'),
                            ),
                          ),
                          child: Container(
                            width: 60,
                            height: 57.4,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Text(
                          'Seviyeni Belirleyelim',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 76),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Haydi seviyeni belirleyelim! Aşağıdan seviyeni seçerek maceraya başlayabiliriz.',
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
                        margin: EdgeInsets.fromLTRB(0, 0, 1, 65),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF0ABBFF)),
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Container(
                          width: 303,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => HomeScreen(level: 'A1-A2'),
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Color(0xFF0ABBFF),
                            ),
                            child: Text(
                              'A1 - A2',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 32,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 1, 65),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF0ABBFF)),
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Container(
                          width: 303,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => HomeScreen(level: 'B1-B2'),
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Color(0xFF0ABBFF),
                            ),
                            child: Text(
                              'B1 - B2',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 32,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 1, 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF0ABBFF)),
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xFFFFFFFF),
                        ),
                        child: Container(
                          width: 303,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => HomeScreen(level: 'C1-C2'),
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white, backgroundColor: Color(0xFF0ABBFF),
                            ),
                            child: Text(
                              'C1 - C2',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 32,
                                letterSpacing: 2,
                              ),
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
