


import 'package:flutter/material.dart';

import '../utils/app_locale.dart';
import '../utils/app_style.dart';

PreferredSizeWidget MainAppBar({String title='',bool leading=false}) {
  return AppBar(
      titleSpacing: 0,
      titleTextStyle: App_style().text_24_700_black,
      title: Text(title),centerTitle: true,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: leading,
      surfaceTintColor: Colors.transparent,
      elevation: 5
  );
}