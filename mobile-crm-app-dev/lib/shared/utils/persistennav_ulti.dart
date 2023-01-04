import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PersistentNavUtil {
  static void pushNewScreen(
    BuildContext context,
    Widget screen, {
    bool withNavBar = true,
  }) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: screen,
      withNavBar: withNavBar,
    );
  }

  static void pushDynamicScreen(
    BuildContext context,
    Route screen, {
    bool withNavBar = true,
  }) {
    PersistentNavBarNavigator.pushDynamicScreen(
      context,
      screen: screen,
      withNavBar: withNavBar,
    );
  }

  static void pushNewScreenWithRouteSettings(
    BuildContext context,
    Widget screen, {
    required RouteSettings settings,
    bool withNavBar = true,
  }) {
    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
      context,
      screen: screen,
      settings: settings,
      withNavBar: withNavBar,
    );
  }
}
