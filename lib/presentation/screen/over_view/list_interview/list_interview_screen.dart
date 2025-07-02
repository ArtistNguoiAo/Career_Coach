import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ListInterviewScreen extends StatelessWidget {
  const ListInterviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Interviews'),
      ),
      body: Center(
        child: Text('This is the List Interview Screen'),
      ),
    );
  }
}
