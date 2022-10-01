import 'package:flutter/material.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Hello world')),
        body: titleWidget,
      ),
    );
  }
}

var titleWidget = Container(
  padding: const EdgeInsets.all(32),
  height: 120,
  child: Row(
    children: [
      Expanded(
        child: Container(
          color: Colors.red,
          padding: const EdgeInsets.only(left: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  'Oeschinen Lake Campground',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'Kandersteg, Switzerland',
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
      Icon(
        Icons.star,
        color: Colors.red[700],
      ),
      const Text('41'),
    ],
  ),
);
