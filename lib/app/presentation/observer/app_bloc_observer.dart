import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Logging for [Cubit] state changes
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('');
    debugPrint(bloc.runtimeType.toString());
    debugPrint(change.nextState.toString());
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('🟢 🟢 🟢 ${bloc.runtimeType.toString()} CREATED 🟢 🟢 🟢 ');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('🔴 🔴 🔴 ${bloc.runtimeType.toString()} DISPOSED 🔴 🔴 🔴');

    super.onClose(bloc);
  }
}
