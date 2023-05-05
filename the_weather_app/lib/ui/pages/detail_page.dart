import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Погода',
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/threeDays');
            },
            icon: Icon(Icons.navigate_next),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            context.go('/login');
          },
          icon: Icon(Icons.navigate_before),
        ),
      ),
    );
  }
}
