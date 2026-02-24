import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Launch Controller',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  // set counter value
  int _counter = 0;

  void increment() {
    setState(() {
      _counter += 1;
      if (_counter > 100) {
        _counter = 100;
      }
      if (_counter == 100) {
        _showSuccessPopup();
      }
    });
  }

  void decrement() {
    setState(() {
      _counter -= 1;
      if (_counter < 0) {
        _counter = 0;
      }
    });
  }

  void reset() {
    setState(() {
      _counter = 0;
    });
  }

  Color _counterColor() {
    if (_counter == 0) {
      return Colors.red;
    } else if (_counter <= 50) {
      return Colors.orange;
    }
    return Colors.green;
  }

  Future<void> _showSuccessPopup() {
  return showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: 'Success Dialog',
    transitionDuration: const Duration(milliseconds: 400),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: AlertDialog(
          title: const Text('Success!'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your rocket has lifted! 🚀'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Dismiss'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.elasticOut,
        ),
        child: child,
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rocket Launch Controller')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.lightBlueAccent,
              child: Text(
                _counter == 100 ? 'LIFTOFF!' : '$_counter',
                style: TextStyle(fontSize: 50.0, color: _counterColor()),
              ),
            ),
          ),
          SizedBox(height: 120),
          Slider(
            min: 0,
            max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              setState(() {
                _counter = value.toInt();
                if (_counter == 100) {
                  _showSuccessPopup();
                }
              });
            },
            activeColor: Colors.blue,
            inactiveColor: Colors.red,
          ),
          SizedBox(height: 8),
          ElevatedButton(onPressed: increment, child: Text('Ignite')),
          SizedBox(height: 8),
          ElevatedButton(onPressed: decrement, child: Text('Decrement')),
          SizedBox(height: 8),
          ElevatedButton(onPressed: reset, child: Text('Reset')),
        ],
      ),
    );
  }
}
