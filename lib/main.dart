import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simpsons_character_viewer/app/observer/app_bloc_observer.dart';
import 'package:simpsons_character_viewer/app/service_locator/service_locator.dart';
import 'package:simpsons_character_viewer/app/simpsons_viewer_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();
  ServiceLocator.init();

  runApp(const SimpsonsViewerApp());
}
