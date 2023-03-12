import 'dart:async';

import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/book.dart';
import 'package:focus_on_words_app/data/provider/books.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:focus_on_words_app/util/flow_utils.dart';
import 'package:provider/provider.dart';

class BonusFlow extends StatefulWidget {
  final Widget child;
  const BonusFlow({super.key, required this.child});

  @override
  State<BonusFlow> createState() => _BonusFlowState();
}

class _BonusFlowState extends State<BonusFlow> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(minutes: 5),
      (Timer t) => _showMessage(context),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

void _showMessage(BuildContext context) async {
  Book book = context.read<BooksProvider>().getRandomBook();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(seconds: 5),
      content: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          FlowUtils.pushBookDetail(context, book);
        },
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: ThemeColors.cardColor),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  color: ThemeColors.selectionColor,
                  width: 48,
                  height: 48,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyles.text,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      book.author,
                      textAlign: TextAlign.left,
                      style: TextStyles.subtext,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () =>
                    ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                icon: const Icon(Icons.close),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    ),
  );
}
