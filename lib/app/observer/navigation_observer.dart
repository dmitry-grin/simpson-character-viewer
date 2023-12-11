import 'package:flutter/material.dart';

class NavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('🚧 DidPush: ${route.settings.name} 🚧');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('🚧 DidPop: ${route.settings.name} 🚧');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('🚧 DidRemove: ${route.settings.name} 🚧');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint('🚧 DidReplace: ${oldRoute?.settings.name} 🚧');
  }
}