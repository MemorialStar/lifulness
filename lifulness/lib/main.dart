import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

const biggerFont = TextStyle(fontSize: 18);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup name Generator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const RandomWords(),
    );
  }
}

class _RandomWordsState extends State<RandomWords> {
  final suggestions = <WordPair>[];
  final saved = <WordPair>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random English words'),
        actions: [
          IconButton(
            onPressed: _pushSaved,
            icon: const Icon(Icons.list),
            tooltip: 'Saved Suggestions',
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= suggestions.length) {
            suggestions.addAll(generateWordPairs().take(10));
          }

          final alreadySaved = saved.contains(suggestions[index]);

          return ListTile(
            title: Text(
              suggestions[index].asPascalCase,
              style: biggerFont,
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
              semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  saved.remove(suggestions[index]);
                } else {
                  saved.add(suggestions[index]);
                }
              });
            },
          );
        },
      ),
    );
  }

  void _pushSaved() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SavedRoute(saved)));
  }
}

// ignore: must_be_immutable
class SavedRoute extends StatelessWidget {
  Set<WordPair> saved;

  SavedRoute(this.saved, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tiles = saved.map((pair) {
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: biggerFont,
        ),
      );
    });
    final divided = tiles.isNotEmpty
        ? ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList()
        : <Widget>[];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(children: divided),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}
