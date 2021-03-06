import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const BuildingLayout());
}

class BuildingLayout extends StatelessWidget {
  const BuildingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    const randomWords = RandomWords();

    return MaterialApp(
      title: 'Innovation Day 07/08/2022',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Innovation Day 07/08/2022'),
        ),
        body: const Center(
          child: randomWords,
        ),
      )
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );
  }
}