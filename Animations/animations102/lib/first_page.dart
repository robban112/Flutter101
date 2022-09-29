import 'package:animations102/second_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key, required this.title});

  final String title;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buidHero2(),
            const SizedBox(height: 24),
            Text(
              'First page',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 24),
            MaterialButton(
                child: Text('To second page'),
                color: Colors.black.withOpacity(0.01),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage(title: 'Second page')));
                })
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  /// Builds the hero widget on first page
  Hero _buidHero1() {
    return Hero(
      tag: 'asd',
      child: Container(height: 40, width: 40, color: Colors.red),
    );
  }

  /// Builds the hero widget on first page with a flightShuttleBuilder
  Hero _buidHero2() {
    return Hero(
      tag: 'hero_widget',
      child: Container(height: 40, width: 40, color: Colors.red),
      flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, _) => Transform.rotate(
            angle: animation.value * 1.1,
            child: Container(
              height: 80,
              width: 80,
              color: Colors.yellow,
            ),
          ),
        );
      },
    );
  }
}
