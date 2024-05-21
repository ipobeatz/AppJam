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
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> _questions = [
    "Question 1: What is Flutter?",
    "Question 2: What is Dart?",
    "Question 3: What is a Widget?",
    "Question 4: Explain Stateful and Stateless Widgets.",
    "Question 5: What is State Management?",
    "Question 6: Explain Navigator in Flutter.",
    "Question 7: What is the use of setState?",
    "Question 8: Explain InheritedWidget.",
    "Question 9: What is a Future in Dart?",
    "Question 10: What is an Async/Await in Dart?"
  ];
  final List<String> _answers = [
    "Answer 1: Flutter is an open-source UI software development toolkit created by Google.",
    "Answer 2: Dart is a programming language optimized for building mobile, desktop, server, and web applications.",
    "Answer 3: A widget is an immutable description of part of a user interface.",
    "Answer 4: Stateful widgets maintain state that might change during the lifetime of the widget. Stateless widgets do not.",
    "Answer 5: State management refers to the management of the state of one or more UI controls.",
    "Answer 6: Navigator is a widget that manages a set of child widgets with a stack discipline.",
    "Answer 7: setState() is a method used to update the state of a stateful widget.",
    "Answer 8: InheritedWidget is a base class for widgets that efficiently propagate information down the tree.",
    "Answer 9: A Future is a means for getting a value sometime in the future.",
    "Answer 10: Async/await is a way to handle asynchronous operations in Dart."
  ];
  List<String> _savedQuestions = [];
  bool _showFrontSide = true;

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
                            color: Colors.white,
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
                            color: Colors.white,
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
                        : 'Next Question',
                  ),
                ),
              ],
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
