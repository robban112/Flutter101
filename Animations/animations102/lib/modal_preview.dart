import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ModalPreviewApp extends StatelessWidget {
  const ModalPreviewApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ModalPreviewPage(),
    );
  }
}

class ModalPreviewPage extends StatelessWidget {
  const ModalPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Click box to preview",
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () => Navigator.of(context).push(ModalPageRouteBuilder(child: ModalPreviewModal())),
              child: Hero(
                tag: 'hero',
                child: SizedBox(
                  height: 200,
                  child: Image.network('https://picsum.photos/250?image=1'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ModalPreviewModal extends StatelessWidget {
  const ModalPreviewModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(context),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
          ),
          child: Hero(
            tag: 'hero',
            child: SizedBox(
              child: Image.network(
                'https://picsum.photos/250?image=1',
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ModalPageRouteBuilder extends PageRouteBuilder {
  final Widget child;

  ModalPageRouteBuilder({
    Key? key,
    required this.child,
  }) : super(
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (
              context,
              animation,
              secondaryAnimation,
            ) =>
                child);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ScaleTransition(
      alignment: Alignment.center,
      scale: Tween<double>(begin: 0.0, end: 1).chain(CurveTween(curve: Curves.easeIn)).animate(animation),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(200)),
        child: child,
      ),
    );
  }
}
