import 'package:flutter/material.dart';
import 'package:intership_project/ui/navigation/main_navigation.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Order'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(MainNavigationRouteNames.orderScreen);
            },
            child: const Text('Order screen'),
          ),
        ],
      ),
    );
  }
}
