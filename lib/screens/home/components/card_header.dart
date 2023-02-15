import 'package:flutter/material.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({Key? key, required this.title, required this.data})
      : super(key: key);

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Expanded(
          child: Text(
            data,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
