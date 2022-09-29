import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Surfpay Animation Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));

  late final Animation<Offset> positionAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(0.5, 0)).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    ),
  );

  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Slide Transition to slide the container
        child: SlideTransition(
          /// positionAnimation is the animation being used to slide between Offets driven by animationController
          position: positionAnimation,
          // Fade transition animation, fades the widget
          child: FadeTransition(
            opacity: Tween<double>(begin: 1, end: 0.8).animate(controller),
            // Custom Widget that rebuilds itself. Useful for custom `Transition` animations
            child: MyAnimatedContainer(controller: controller),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _incrementCounter() {
    if (controller.value == 1.0) {
      controller.reverse();
    } else if (controller.value == 0.0) {
      controller.forward();
    }
  }
}

class MyAnimatedContainer extends AnimatedWidget {
  final AnimationController controller;

  late final Animation<Color?> _colorTween = ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);

  late final Animation<double> _transform = Tween<double>(begin: 0, end: 5).animate(controller);

  late final Animation<double> _sizeTween = Tween<double>(begin: 50, end: 250).animate(controller);

  MyAnimatedContainer({super.key, required this.controller}) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _transform.value,
      child: Container(
        height: _sizeTween.value,
        width: _sizeTween.value,
        color: _colorTween.value,
      ),
    );
  }
}
