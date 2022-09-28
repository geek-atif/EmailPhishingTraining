import 'package:flutter/material.dart';

class RolePlaySucessScreen extends StatefulWidget {
  const RolePlaySucessScreen({super.key});

  @override
  State<RolePlaySucessScreen> createState() => _RolePlaySucessScreenState();
}

class _RolePlaySucessScreenState extends State<RolePlaySucessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
