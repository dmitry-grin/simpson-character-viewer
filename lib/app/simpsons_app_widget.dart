import 'package:flutter/material.dart';
import 'package:simpsons_character_viewer/app/app_router.dart';

/// The root widget for the Simpsons App, implementing the MaterialApp structure.
class SimpsonsAppWidget extends StatelessWidget {
  const SimpsonsAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}

