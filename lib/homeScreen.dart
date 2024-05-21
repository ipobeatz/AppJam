import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_wise/questionsAnswerScreen.dart';
import 'package:word_wise/translation_service.dart';

import 'kullanici_profil.dart';

void main() => runApp(HomeScreen(level: 'A1-A2'));

class HomeScreen extends StatelessWidget {
  final String level;
  const HomeScreen({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Word Wise', level: level),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final String level;
  const MyHomePage({super.key, required this.title, required this.level});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  final PageController _pageController = PageController(initialPage: 0);
  List<String> _questions = [];
  List<String> _answers = [];
  List<String> _savedQuestions = [];
  bool _showFrontSide = true;

  @override
  void initState() {
    super.initState();
    _initializeQuestionsAndAnswers(widget.level);
  }

  void _initializeQuestionsAndAnswers(String level) {
    if (level == 'A1-A2') {
      _questions = [
        "Book",
        "Dog",
        "Water",
        // More A1-A2 questions
      ];
      _answers = [
        "I borrowed a book from the library yesterday.",
        "We have a friendly dog that loves to play in the park.",
        "It is important to drink plenty of water every day.",
        // More A1-A2 answers
      ];
    } else if (level == 'B1-B2') {
      _questions = [
        "B1-B2: What is Flutter?",
        "B1-B2: What is Dart?",
        // More B1-B2 questions
      ];
      _answers = [
        "B1-B2: Flutter is an open-source UI software development toolkit created by Google.",
        "B1-B2: Dart is a programming language optimized for building mobile, desktop, server, and web applications.",
        // More B1-B2 answers
      ];
    } else if (level == 'C1-C2') {
      _questions = [
        "C1-C2: What is Flutter?",
        "C1-C2: What is Dart?",
        // More C1-C2 questions
      ];
      _answers = [
        "C1-C2: Flutter is an open-source UI software development toolkit created by Google.",
        "C1-C2: Dart is a programming language optimized for building mobile, desktop, server, and web applications.",
        // More C1-C2 answers
      ];
    }
  }

  void _toggleQuestionInSaved() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        int currentPage = _pageController.hasClients ? _pageController.page?.toInt() ?? 0 : 0;
        String currentQuestion = _questions[currentPage];
        if (_savedQuestions.contains(currentQuestion)) {
          _savedQuestions.remove(currentQuestion);
        } else {
          _savedQuestions.add(currentQuestion);
        }
      });
    });
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => QuestionsAnswerScreen()));
  }

  void _toggleCardSide() {
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  List<Widget> _pages(BuildContext context) => <Widget>[
    ListView.builder(
      itemCount: _savedQuestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_savedQuestions[index]),
        );
      },
    ),
    Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0.10,
          left: 0,
          bottom: MediaQuery.of(context).size.height * 0.10,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Card(
              color: Colors.red[200],
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Center(
                child: Text(
                  '',
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
          bottom: MediaQuery.of(context).size.height * 0.10,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.1,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Card(
              color: Colors.blue[100],
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),
              ),
              child: Center(
                child: Text(
                  '',
                  style: GoogleFonts.lato(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.8, // Kart ve buton için yeterli alan ayırdık
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _questions.length,
                    onPageChanged: (index) {
                      setState(() {
                        _showFrontSide = true; // Yeni bir sayfaya geçildiğinde her zaman ön yüzü göster
                      });
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onDoubleTap: _toggleCardSide,
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            return RotationYTransition(
                              child: child,
                              animation: animation,
                            );
                          },
                          child: _showFrontSide
                              ? Card(
                            key: ValueKey<bool>(_showFrontSide),
                            color: Colors.red[300],
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  _questions[index],
                                  style: GoogleFonts.lato(fontSize: 24),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          )
                              : Card(
                            key: ValueKey<bool>(_showFrontSide),
                            color: Colors.blue[200],
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  _answers[index],
                                  style: GoogleFonts.lato(fontSize: 24),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _toggleQuestionInSaved,
                  child: Text(
                    _savedQuestions.contains(_questions[_pageController.hasClients ? _pageController.page?.toInt() ?? 0 : 0])
                        ? 'Remove from Saved'
                        : 'Questions',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    UserProfileScreen(), // Profil sayfası burada ekleniyor
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TranslatorScreen()));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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

class RotationYTransition extends AnimatedWidget {
  final Widget child;
  final Animation<double> animation;

  RotationYTransition({
    required this.child,
    required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final double angle = animation.value * 3.14159;
    return Transform(
      transform: Matrix4.rotationY(angle),
      alignment: Alignment.center,
      child: animation.value >= 0.5
          ? Transform(
        transform: Matrix4.rotationY(3.14159),
        alignment: Alignment.center,
        child: child,
      )
          : child,
    );
  }
}

// TranslatorScreen class
class TranslatorScreen extends StatefulWidget {
  @override
  _TranslatorScreenState createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _translatedWord = '';
  bool _isLoading = false;
  String _errorMessage = '';

  void _translateWord() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final translatedWord = await translateToTurkish(_controller.text);
      final firstWord = translatedWord.split(' ')[0]; // Çeviri sonucundan ilk kelimeyi alın

      setState(() {
        _translatedWord = firstWord;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error translating word';
      });
    }
  }

  Widget _buildTranslationResult() {
    if (_isLoading) {
      return CircularProgressIndicator();
    } else if (_errorMessage.isNotEmpty) {
      return Text(_errorMessage, style: TextStyle(color: Colors.red));
    } else if (_translatedWord.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Çeviri: $_translatedWord',
            style: TextStyle(fontSize: 18, color: Colors.green),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Translator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter a word',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _translateWord,
              child: Text('Translate'),
            ),
            SizedBox(height: 20),
            _buildTranslationResult(),
          ],
        ),
      ),
    );
  }
}
