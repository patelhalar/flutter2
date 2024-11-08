import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const CupertinoApp(
    title: 'Shop',
    home: FirstScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

      navigationBar: const CupertinoNavigationBar(
        middle: Text('This is Screen1'),
      ),

      child: Center(
        child: CupertinoButton(
          child: const Text('Goto Screen2'),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const SecondScreen()),
            );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('This is Screen2'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Goto Screen1'),
        ),
      ),
    );
  }
}
  class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {

    const String appTitle = '';


    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            //title: const Text('Application Form'),

          ),
          body: const ElevatedButtonExample()

      ),
    );
  }
}
class ElevatedButtonExample extends StatefulWidget {
  const ElevatedButtonExample({super.key});

  @override
  State createState() => _ElevatedButtonExampleState();
}

class _ElevatedButtonExampleState extends State {
  final myController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Center(
            child: Text('Save Data', textAlign: TextAlign.center),
          ),
          const SizedBox(height: 10),

          Padding(padding: const EdgeInsets.only(left:100.0,top:0.0,right: 100.0, bottom:0.0),child: TextField(

            maxLength: 100,
            controller: myController,

          )),

          Center(
            child: ElevatedButton(
              style: style,
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('name', myController.text);
                showDialog(
                  context: context,
                  builder: (context) {

                    return AlertDialog(
                      title: const Text('Navarchana University'),
                      content: Text('${myController.text} is Saved'),

                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () async {

                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Add to cart'),
            ),
          ),

          Center(
            child: ElevatedButton(
              style: style,
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final sname = prefs.getString('name') ?? 'None';
                showDialog(
                  context: context,
                  builder: (context) {

                    return AlertDialog(
                      title: const Text('Cart'),
                      content: Text('${sname}''${sname}''${sname}''${sname}'),

                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('remove product'),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: style,
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();

                await prefs.remove('name');
                showDialog(
                  context: context,
                  builder: (context) {

                    return AlertDialog(
                      title: const Text('Navarchana University'),
                      content: Text('Value is Cleared'),

                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Clear Value'),
            ),
          ),
        ],
      ),
    );

      const String appTitle = '';


      return MaterialApp(
        debugShowCheckedModeBanner: false,

        title: appTitle,
        home: Scaffold(
            appBar: AppBar(
              //title: const Text('Application Form'),

            ),
            body: const ElevatedButtonExample()

        ),
      );
    }
  }




  // This widget is the root of your application.
class ElevatedButtonEx extends StatefulWidget {
  const ElevatedButtonEx({super.key});

  @override
  State createState() => _ElevatedButtonExState();
}

class _ElevatedButtonExState extends State {
  final myController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Center(
            child: Text('Log In Form', textAlign: TextAlign.center),
          ),
          const SizedBox(height: 10),

          Padding(padding: const EdgeInsets.only(left:100.0,top:0.0,right: 100.0, bottom:0.0),child: TextField(

            maxLength: 100,
            controller: myController,

          )),

          Center(
            child: ElevatedButton(
              style: style,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {

                    return AlertDialog(
                      title: const Text('Navarchana University'),
                      content: Text('Your Name is ${myController.text}'),

                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('LogIn'),
            ),
          ),
        ],
      ),
    );
  }
}

