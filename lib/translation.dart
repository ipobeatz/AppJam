import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_wise/questionsAnswerScreen.dart';
import 'package:word_wise/translation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(TranslatorScreen());

class TranslatorScreen extends StatefulWidget {
  @override
  _TranslatorScreenState createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _translatedWord = '';
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _translateWord() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final prefs = await SharedPreferences.getInstance();
    final cacheKey = 'translation_${_controller.text}';
    final cachedTranslation = prefs.getString(cacheKey);

    if (cachedTranslation != null) {
      setState(() {
        _translatedWord = cachedTranslation;
        _isLoading = false;
      });
    } else {
      try {
        final translatedWord = await translateToTurkish(_controller.text);
        final firstWord = translatedWord.split(' ')[0]; // Çeviri sonucundan ilk kelimeyi alın

        setState(() {
          _translatedWord = firstWord;
          _isLoading = false;
        });

        prefs.setString(cacheKey, firstWord);
      } catch (e) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Error translating word';
        });
      }
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
