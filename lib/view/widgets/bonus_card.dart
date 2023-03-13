import 'package:flutter/material.dart';
import 'package:focus_on_words_app/data/book.dart';
import 'package:focus_on_words_app/data/provider/books.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:focus_on_words_app/util/flow_utils.dart';
import 'package:provider/provider.dart';

class BonusCard extends StatelessWidget {
  final Book book;
  const BonusCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        FlowUtils.pushBookDetail(context, book);
      },
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: ThemeColors.cardColor),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ThemeColors.cardColor,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(book.thumbnail),
                  ),
                ),
                width: 48,
                height: 48,
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyles.text.copyWith(fontSize: 14),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      book.authors,
                      textAlign: TextAlign.left,
                      style: TextStyles.subtext.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () =>
                    ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showBonusMessage(BuildContext context) {
  try {
    Book? book = context.read<BooksProvider>().getRandomBook();
    if (book != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          duration: const Duration(seconds: 5),
          content: BonusCard(book: book),
        ),
      );
    }
  } catch (e) {
    //
  }
}
