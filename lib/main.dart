import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Airbnb Animation demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double a = 0.18;
  double w = 5.2;

  double target = 1;
  double target2 = 0;
  double target3 = 0;
  double target4 = 0;
  double target5 = 0;


  updateTarget(double value) {
    target = value;
    Future.delayed(Duration(milliseconds: 150)).then((_) {
      target2 = 1;
      setState(() {});
    });
    Future.delayed(Duration(milliseconds: 130 * 2)).then((_) {
      target3 = value;
      setState(() {});
    });
    Future.delayed(Duration(milliseconds: 130 * 3)).then((_) {
      target4 = value;
      setState(() {});
    });

    Future.delayed(Duration(milliseconds: 130 * 4)).then((_) {
      target5 = value;
      setState(() {});
    });

    setState(() {});
  }

  animateToOne() {
    updateTarget(1);
  }

  animateToZero() {
    target = 0;
    target2 = 0;
    target3 = 0;
    target4 = 0;
    target5 = 0;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: [
                Transform.rotate(
                  angle: 0.145,
                  child: Container(
                    width: 101,
                    height: 101,
                    color: Colors.amber,
                    child: Text('1'),
                  ),
                )
                    .animate(
                      onComplete: (controller) {
                        if (target == 0) {
                          target = 1;

                          setState(() {});
                        }
                      },
                      target: target,
                    )
                    .fadeIn(
                        duration: Duration(milliseconds: 130),
                        curve: Curves.easeOut)
                    .scale(
                      duration: Duration(milliseconds: 550),
                      curve: SpringCurve(a: a, w: w),
                    ),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 0),
                  child: Transform.rotate(
                    angle: -0.145,
                    child: Container(
                      width: 102,
                      height: 102,
                      color: Colors.greenAccent,
                      child: Text('2'),
                    ),
                  )
                      .animate(
                        onComplete: (controller) {
                          if (target2 == 0) {
                            Future.delayed(Duration(milliseconds: 150))
                                .then((_) {
                              setState(() {
                                target2 = 1;
                              });
                            });
                          }
                        },
                        target: target2,
                        // delay: Duration(milliseconds: 150)
                      )
                      .fadeIn(
                          duration: Duration(milliseconds: 130),
                          curve: Curves.easeOut)
                      .scale(
                          duration: Duration(milliseconds: 550),
                          curve: SpringCurve(a: a, w: w)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 68, top: 0),
                  child: Transform.rotate(
                    angle: -0.090,
                    child: Container(
                      width: 102,
                      height: 103,
                      color: Colors.blueAccent,
                      child: Text('3'),
                    ),
                  )
                      .animate(
                        onComplete: (controller) {
                          if (target3 == 0) {
                            Future.delayed(Duration(milliseconds: 130 * 2))
                                .then((_) {
                              setState(() {
                                target3 = 1;
                              });
                            });
                          }
                        },
                        target: target3,
                        // delay: Duration(milliseconds: 130*2)
                      )
                      .fadeIn(
                          duration: Duration(milliseconds: 130),
                          curve: Curves.easeOut)
                      .scale(
                          duration: Duration(milliseconds: 550),
                          curve: SpringCurve(a: a, w: w)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 110, top: 0),
                  child: Transform.rotate(
                    angle: 0.145,
                    child: Container(
                      width: 104,
                      height: 104,
                      color: Colors.pinkAccent,
                      child: Text('4'),
                    ),
                  )
                      .animate(
                        onComplete: (controller) {
                          if (target4 == 0) {
                            Future.delayed(Duration(milliseconds: 130 * 3))
                                .then((_) {
                              setState(() {
                                target4 = 1;
                              });
                            });
                          }
                        },
                        target: target4,
                        // delay: Duration(milliseconds: 130*3)
                      )
                      .fadeIn(
                          duration: Duration(milliseconds: 130),
                          curve: Curves.easeOut)
                      .scale(
                          duration: Duration(milliseconds: 550),
                          curve: SpringCurve(a: a, w: w)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 150, top: 0),
                  child: Transform.rotate(
                    angle: 0.00,
                    child: Container(
                      width: 105,
                      height: 105,
                      color: Colors.green,
                      child: Text('5'),
                    ),
                  )
                      .animate(
                        onComplete: (controller) {
                          if (target5 == 0) {
                            Future.delayed(Duration(milliseconds: 120 * 4))
                                .then((_) {
                              setState(() {
                                target5 = 1;
                              });
                            });
                            // animateToOne();
                          }
                        },
                        target: target5,
                        // delay: Duration(milliseconds: 120*4
                        // )
                      )
                      .fadeIn(
                          duration: Duration(milliseconds: 130),
                          curve: Curves.easeOut)
                      .scale(
                          begin: Offset(0.2, 0.2),
                          duration: Duration(milliseconds: 550),
                          curve: SpringCurve(a: a, w: w)),
                )
              ],
            ),

            SizedBox(
              height: 100,
            ),
            ElevatedButton(
                onPressed: () {
                  animateToZero();
                  // firstController.forward();
                },
                child: Text('Play Again'))
            //SpringCurve(a: 0.10,w: 15))
          ],
        ),
      ),
    );
  }
}

class SpringCurve extends Curve {
  const SpringCurve({
    this.a = 0.15,
    this.w = 19.4,
  });
  final double a;
  final double w;

  @override
  double transformInternal(double t) {
    return -(pow(e, -t / a) * cos(t * w)) + 1;
  }
}
