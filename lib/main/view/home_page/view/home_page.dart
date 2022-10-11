import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              color: Colors.red,
            ),
            Container(
              height: 500,
              color: Colors.blue,
            ),
            Container(
              height: 500,
            )
          ],
        ),
      ),
    );
  }
}
