import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:focus_on_words_app/data/book.dart';
import 'package:focus_on_words_app/data/provider/bonus.dart';
import 'package:focus_on_words_app/data/provider/bottom_navigation.dart';
import 'package:focus_on_words_app/data/provider/favorites.dart';
import 'package:focus_on_words_app/data/provider/books.dart';
import 'package:focus_on_words_app/util/flow_utils.dart';
import 'package:focus_on_words_app/view/adapter.dart';
import 'package:focus_on_words_app/view/pages/book_detail.dart';
import 'package:focus_on_words_app/view/pages/error_page.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:focus_on_words_app/view/pages/home_page.dart';
import 'package:focus_on_words_app/view/pages/profile_page.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: ThemeColors.backgroundColor,
      statusBarIconBrightness: Brightness.light,
      statusBarColor: ThemeColors.backgroundColor,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();

  setUrlStrategy(PathUrlStrategy());

  runApp(const App());
}

/// Main App
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => BottomNavProvider()),
        ChangeNotifierProvider(create: (c) => FavoritesProvider()..init()),
        ChangeNotifierProvider(create: (c) => BooksProvider()..init()),
        ChangeNotifierProvider(create: (c) => BonusProvider()..init()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark,
          highlightColor: ThemeColors.overlayColor,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.white,
            selectionColor: ThemeColors.selectionColor,
            selectionHandleColor: Colors.transparent,
          ),
          colorScheme: const ColorScheme.dark(
            primary: ThemeColors.textColor,
            secondary: Colors.black,
          ),
        ),
        initialRoute: Keys.home,
        onGenerateRoute: (settings) {
          // Routes
          switch (settings.name) {
            case Keys.home:
              return _buildRoute(const Home());
            case Keys.profile:
              return _buildRoute(const ProfilePage());
            case Keys.book:
              Book? book = FlowUtils.getBookFromArgs(settings.arguments);
              return book != null
                  ? _buildRoute(BookPage(book: book), isNested: true)
                  : _buildRoute(const ErrorPage());
            default:
              return _buildRoute(const ErrorPage());
          }
        },
      ),
    );
  }
}

/// Build route
Route<dynamic> _buildRoute(
  Widget page, {
  bool isNested = false,
}) {
  return isNested
      ? MaterialPageRoute(
          builder: (c) => Adapter(page: page, isNested: isNested))
      : _UnanimatedPageRoute(
          builder: (c) => Adapter(page: page, isNested: isNested));
}

/// Unanimated transition
class _UnanimatedPageRoute<T> extends MaterialPageRoute<T> {
  _UnanimatedPageRoute({
    required Widget Function(BuildContext) builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      child;
}
