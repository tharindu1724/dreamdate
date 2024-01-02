import 'package:flutter/material.dart';

class LikeReceived extends StatefulWidget {
  const LikeReceived({super.key});

  @override
  State<LikeReceived> createState() => _LikeReceivedState();
}

class _LikeReceivedState extends State<LikeReceived> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
    );
  }
}