import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_wise/loginScreen.dart';
import 'package:word_wise/splashScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Word Wise'),
      debugShowCheckedModeBanner: false,
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
  int _selectedIndex = 1; // Default olarak Home Page seçili olacak
  double _leftCardOffset = 0;
  double _rightCardOffset = 0;
  double _mainCardOffsetX = 0;
  double _mainCardOffsetY = 0;
  String _mainCardText = "Main Card";
  String _leftCardText = "Left";
  String _rightCardText = "Right";

  List<Widget> _pages(BuildContext context) => <Widget>[
    Center(child: Text('Saved Page')),
    Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          top: MediaQuery.of(context).size.height * 0.15 + _mainCardOffsetY,
          left: MediaQuery.of(context).size.width * 0.15 + _mainCardOffsetX,
          right: MediaQuery.of(context).size.width * 0.15 - _mainCardOffsetX,
          bottom: MediaQuery.of(context).size.height * 0.15 - _mainCardOffsetY,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                _mainCardOffsetX += details.delta.dx;
                _mainCardOffsetY += details.delta.dy;
              });
            },
            onPanEnd: (details) {
              if (_mainCardOffsetX > 100) {
                // Sağ tarafa kaydırıldı
                setState(() {
                  _mainCardOffsetX = MediaQuery.of(context).size.width;
                  String temp = _mainCardText;
                  _mainCardText = _rightCardText;
                  _rightCardText = temp;
                  _mainCardOffsetX = 0;
                  _mainCardOffsetY = 0;
                });
              } else if (_mainCardOffsetX < -100) {
                // Sol tarafa kaydırıldı
                setState(() {
                  _mainCardOffsetX = -MediaQuery.of(context).size.width;
                  String temp = _mainCardText;
                  _mainCardText = _leftCardText;
                  _leftCardText = temp;
                  _mainCardOffsetX = 0;
                  _mainCardOffsetY = 0;
                });
              } else {
                setState(() {
                  _mainCardOffsetX = 0;
                  _mainCardOffsetY = 0;
                });
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Card(
                color: Colors.black38,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    _mainCardText,
                    style: GoogleFonts.lato(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.10,
          left: 0,
          bottom: MediaQuery.of(context).size.height * 0.10, // Bu, sol card'ın tam yüksekliği kapsamasını sağlar
          child: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.6, // Bu, card'ın tam yüksekliği kapsamasını sağlar
            child: Card(
              color: Colors.red,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Center(
                child: Text(
                  _leftCardText,
                  style: GoogleFonts.lato(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.10,
          right: 0,
          bottom: MediaQuery.of(context).size.height * 0.10, // Bu, sağ card'ın tam yüksekliği kapsamasını sağlar
          child: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.6, // Bu, card'ın tam yüksekliği kapsamasını sağlar
            child: Card(
              color: Colors.blue,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
              ),
              child: Center(
                child: Text(
                  _rightCardText,
                  style: GoogleFonts.lato(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
    Center(child: Text('Profile Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages(context).elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
