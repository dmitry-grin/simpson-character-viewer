import 'package:flutter/material.dart';
import 'package:simpsons_character_viewer/app/app_router.dart';

class SimpsonsAppWidget extends StatelessWidget {
  const SimpsonsAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
