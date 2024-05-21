import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homeScreen.dart';


void main() {
  runApp(const QuestionsAnswerScreen());
}

class QuestionsAnswerScreen extends StatelessWidget {
  const QuestionsAnswerScreen({super.key});

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
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;

  final List<String> _questions = [
    "Why does Anna go to the park?",
    "What is Flutter?",
  ];

  final List<List<String>> _options = [
    ["To Meet Friends", "To read her book", "To run", "To eat lunch"],
    ["A programming language", "A UI toolkit", "A database", "A framework"],
  ];

  final List<String> _correctAnswersList = [
    "To read her book",
    "A UI toolkit",
  ];

  String _selectedAnswer = '';

  void _selectAnswer(String answer) {
    setState(() {
      _selectedAnswer = answer;
    });
  }

  Color _getButtonColor(String answer) {
    if (_selectedAnswer == '') {
      return Colors.white;
    } else if (answer == _correctAnswersList[_currentQuestionIndex]) {
      return Colors.green;
    } else if (answer == _selectedAnswer) {
      return Colors.red;
    } else {
      return Colors.white;
    }
  }

  void _nextQuestion() {
    if (_selectedAnswer == _correctAnswersList[_currentQuestionIndex]) {
      _correctAnswers++;
    } else {
      _showIncorrectDialog();
      return;
    }

    if (_correctAnswers == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen(level: 'A1-A2')),
      );
    } else {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = '';
      });
    }
  }

  void _showIncorrectDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hata'),
          content: Text('Lütfen bütün soruları doğru yaptığınızdan emin olunuz.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _selectedAnswer = '';
                });
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
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
                  right: -104,
                  top: -238,
                  child: SizedBox(
                    width: 178,
                    height: 172,
                  ),
                ),
                Positioned(
                  left: -94,
                  top: 636,
                  child: SizedBox(
                    width: 178,
                    height: 172,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 94),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 93, 0, 40),
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
                        margin: EdgeInsets.fromLTRB(1, 0, 0, 43),
                        child: Text(
                          'Soruları Tamamla!',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 0, 43),
                        child: Text(
                          _questions[_currentQuestionIndex],
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      ..._options[_currentQuestionIndex].map((option) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(8, 0, 0, 47),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 3.5, 0, 3.5),
                            child: ElevatedButton(
                              onPressed: () {
                                _selectAnswer(option);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _getButtonColor(option),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 4,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                                child: Text(
                                  option,
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      Container(
                        margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedAnswer = '';
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF0ABBFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  elevation: 4,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(13, 14, 10, 13),
                                  child: Text(
                                    'Tekrar Dene',
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              ElevatedButton(
                                onPressed: () {
                                  _nextQuestion();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF0ABBFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  elevation: 4,
                                ),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(10, 14, 10, 13),
                                  child: Text(
                                    'Sıradaki Soru',
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
