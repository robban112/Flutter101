import 'package:flutter/cupertino.dart';
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
      home: const FirstRoute(),
    );
  }
}

/// First Page
class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            // Navigate to second route when tapped.
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SecondRoute()));
            Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => SecondRoute(
                  parameterOne: 1,
                  parameterTwo: Parameter(2),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Second Page

class Parameter {
  final int value;
  Parameter(this.value);
}

class SecondRoute extends StatelessWidget {
  final int parameterOne;

  final Parameter? parameterTwo;
  const SecondRoute({
    super.key,
    required this.parameterOne,
    required this.parameterTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route: $parameterOne'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => SecondRoute(
                      parameterOne: 1,
                      parameterTwo: Parameter(2),
                    ),
                  ),
                );
              },
              child: const Text('Go further!'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
                Navigator.of(context).pop();
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
