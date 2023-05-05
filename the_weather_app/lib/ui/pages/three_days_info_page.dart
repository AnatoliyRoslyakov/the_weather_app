import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class ThreeDaysInfoPage extends StatelessWidget {
  const ThreeDaysInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Погода на 3 дня'),
        leading: IconButton(
          onPressed: () {
            context.go('/detail');
          },
          icon: Icon(Icons.navigate_before),
        ),
      ),
    );
  }
}
