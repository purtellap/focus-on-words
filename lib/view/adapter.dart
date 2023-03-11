import 'package:flutter/material.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:focus_on_words_app/view/scaffolds.dart';

class Adapter extends StatelessWidget {
  final Widget page;
  final Widget? altMobile;

  /// Adapts screens for mobile views
  const Adapter({Key? key, required this.page, this.altMobile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Dimens.mobileConstraint) {
          return MaterialScaffold(
            child: page,
          );
        } else {
          return MaterialScaffold(
            child: altMobile ?? page,
          );
        }
      },
    );
  }
}
