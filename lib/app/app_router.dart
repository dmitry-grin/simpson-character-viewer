import 'package:go_router/go_router.dart';
import 'package:simpsons_character_viewer/app/observer/navigation_observer.dart';
import 'package:simpsons_character_viewer/modules/character_viewer/presentation/routes/character_viewer_routes.dart';

final appRouter = GoRouter(
  initialLocation: CharacterViewerRoutes.characterSearch,
  observers: [NavigationObserver()],
  routes: [...CharacterViewerRoutes().init()],
);
