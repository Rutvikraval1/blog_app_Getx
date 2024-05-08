

import 'package:flutter/material.dart';
import '../utils/custColors.dart';

class Scaffold_widget extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  const Scaffold_widget({super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.drawer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,

  });

  @override
  State<Scaffold_widget> createState() => _Scaffold_widgetState();
}

class _Scaffold_widgetState extends State<Scaffold_widget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.backgroundColor ??AppColors.whiteColorf8f8,
        appBar: widget.appBar,
        body:widget.body,
        bottomNavigationBar: widget.bottomNavigationBar,
        drawer: widget.drawer,
        floatingActionButtonLocation:widget.floatingActionButtonLocation,
        floatingActionButton:widget.floatingActionButton ,

      ),
    );
  }
}
