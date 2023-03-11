import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:focus_on_words_app/view/adapter.dart';
import 'package:focus_on_words_app/data/bottom_navigation.dart';
import 'package:focus_on_words_app/view/pages/error.dart';
import 'package:focus_on_words_app/view/pages/home.dart';
import 'package:focus_on_words_app/view/pages/favorites.dart';
import 'package:focus_on_words_app/res/res.dart';
import 'package:focus_on_words_app/view/pages/profile.dart';
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

  setUrlStrategy(PathUrlStrategy());

  runApp(const App());
}

/// Main App
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavProvider(),
      child: MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.white,
            selectionColor: ThemeColors.selectionColor,
            selectionHandleColor: Colors.transparent,
          ),
          colorScheme: const ColorScheme.dark(),
        ),
        initialRoute: Keys.home,
        onGenerateRoute: (settings) {
          // Routes
          switch (settings.name) {
            case Keys.home:
              return _buildRoute(const Home());
            case Keys.favorites:
              return _buildRoute(const FavoritesPage());
            case Keys.profile:
              return _buildRoute(const ProfilePage());
            // case Keys.book:
            //   return _buildRoute(const BookPage());
            default:
              return _buildRoute(const ErrorPage());
          }
        },
      ),
    );
  }
}

/// Build route
Route<dynamic> _buildRoute(Widget page, {bool animate = false}) {
  if (animate) {
    return MaterialPageRoute(builder: (c) => Adapter(page: page));
  } else {
    return _UnanimatedPageRoute(builder: (c) => Adapter(page: page));
  }
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
