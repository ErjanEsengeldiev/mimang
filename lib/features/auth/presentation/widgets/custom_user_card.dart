import 'package:flutter/material.dart';

class CustomUserCardWidget extends StatelessWidget {
  final String title;
  const CustomUserCardWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    print('object');
    return Card(
      child: ListTile(
        leading: Text(title),
      ),
    );
  }
}
