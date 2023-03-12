import 'package:flutter/material.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:focus_on_words_app/view/scaffold.dart';

class Adapter extends StatelessWidget {
  final Widget page;
  final Widget? altMobile;
  final bool isNested;

  /// Adapts screens for mobile views
  const Adapter(
      {Key? key, required this.page, this.altMobile, this.isNested = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final Widget child = constraints.maxWidth > Dimens.mobileConstraint
            ? page
            : altMobile ?? page;
        return _build(isNested, child);
      },
    );
  }
}

Widget _build(bool isNested, Widget child) {
  if (isNested) {
    return child;
  } else {
    return MaterialScaffold(child: child);
  }
}
