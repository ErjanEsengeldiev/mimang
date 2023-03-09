import 'package:flutter/material.dart';
import 'package:mi_mang/features/auth/presentation/widgets/custom_user_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MiMang.')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Users'),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) => CustomUserCardWidget(
                title: '$index',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
