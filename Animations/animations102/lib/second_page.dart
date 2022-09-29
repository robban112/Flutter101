import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.title});

  final String title;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildHero1(),
            const SizedBox(height: 24),
            Text(
              'Second page',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 24),
            MaterialButton(
                child: Text('Pop'),
                color: Colors.black.withOpacity(0.01),
                onPressed: () {
                  Navigator.of(context).pop(context);
                })
          ],
        ),
      ),
    );
  }

  Hero _buildHero1() {
    return Hero(
      tag: 'hero_widget',
      child: Transform.rotate(angle: 1.1, child: Container(height: 120, width: 120, color: Colors.blue)),
    );
  }
}
