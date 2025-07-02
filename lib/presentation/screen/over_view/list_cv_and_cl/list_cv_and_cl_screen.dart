import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ListCvAndClScreen extends StatelessWidget {
  const ListCvAndClScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of CVs and Cover Letters'),
      ),
      body: Center(
        child: Text('This is the List CV and Cover Letter Screen'),
      ),
    );
  }
}
