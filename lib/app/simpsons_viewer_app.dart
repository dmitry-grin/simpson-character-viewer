import 'package:flutter/material.dart';
import 'package:simpsons_character_viewer/app/app_router.dart';

class SimpsonsViewerApp extends StatelessWidget {
  const SimpsonsViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
