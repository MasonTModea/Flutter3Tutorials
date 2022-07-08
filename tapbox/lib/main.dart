import 'package:flutter/material.dart';

void main() {
  runApp(const Tapbox());
}

class TapboxA extends StatefulWidget {
  const TapboxA({super.key});
  
  @override
  State<StatefulWidget> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey,
        ),
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        )
      ),
    );
  }
}

class Tapbox extends StatelessWidget {
  const Tapbox({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tapbox Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tapbox Demo'),
        ),
        body: const Center (
          child: TapboxA(),
        ),
      ),
    );
  }
  
}