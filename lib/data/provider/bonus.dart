import 'dart:async';

import 'package:flutter/material.dart';

/// Bottom nav state
class BonusProvider extends ChangeNotifier {
  final StreamController<bool> _controller = StreamController<bool>.broadcast();
  late final Stream<bool> stream = _controller.stream;

  void init() {
    Timer.periodic(
      const Duration(minutes: 5),
      (Timer t) {
        _controller.add(true);
      },
    );
  }
}
