import 'package:flutter/material.dart';
import 'package:focus_on_words_app/util/flow_utils.dart';
import 'package:focus_on_words_app/res/res.dart';

/// Bottom nav state
class BottomNavProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  // Update bottom nav
  void navigateTo(BuildContext context, int value) {
    _index = value;
    switch (value) {
      case 0:
        FlowUtils.pushNav(context, Keys.home);
        break;
      case 1:
        FlowUtils.pushNav(context, Keys.profile);
        break;
      default:
    }
  }
}
