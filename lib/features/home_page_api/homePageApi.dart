import 'package:flutter/material.dart';

class HomePageForApi extends StatefulWidget {
  const HomePageForApi({super.key});

  @override
  State<HomePageForApi> createState() => _HomePageForApiState();
}

class _HomePageForApiState extends State<HomePageForApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Posts"),
       ),
    );
  }
}
