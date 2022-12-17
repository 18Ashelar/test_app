

import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 5.0,
            color: Colors.blueAccent,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}