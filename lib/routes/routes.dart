import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screen/Body.dart';
import '../screen/Home.dart';
import '../screen/ListItem.dart';
import '../screen/Login.dart';
import '../screen/Register.dart';

class InitRoute {
 static int initRouter = 1;
}

GoRouter routes() {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        // redirect: (BuildContext context, GoRouterState state) => '/login',
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: InitRoute.initRouter == 1 ? Login() :InitRoute.initRouter == 2 ? BodyHome(body: Home()) :InitRoute.initRouter == 3 ? Register() : Login(),
        ),
        // builder: (BuildContext context, GoRouterState state) {
        //   return BodyHome(body: Home());
        // },
        routes: <RouteBase>[
          GoRoute(
            path: 'toHome',
            builder: (BuildContext context, GoRouterState state) {
              return BodyHome(body: Home());
            },
          ),
          GoRoute(
            path: 'login',
            // builder: (context, state) => const Login(),
            pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: Login(),
            ),
          ),
          GoRoute(
            path: 'ListItem',
            // builder: (context, state) => const Login(),
            pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: ListItem(),
            ),
          ),
          GoRoute(
            path: 'Register',
            // builder: (context, state) => const Login(),
            pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: Register(),
            ),
          ),
          GoRoute(
            path: 'Home',
            // builder: (context, state) => const Login(),
            pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
              context: context,
              state: state,
              child: BodyHome(body: Home()),
            ),
          ),
        ],
      ),
    ],
  );
}

// Route createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => Login(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(1.0, 0.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    barrierDismissible: true,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // const begin = Offset(1.0, 0.0);
      // const end = Offset.zero;
      // const curve = Curves.ease;

      // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(100.0, 0.0),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.linearToEaseOut,
            reverseCurve: Curves.easeInToLinear,
          ),
        ),
        child: child,
      );
      // return SlideTransition(
      //   position: animation.drive(tween),
      //   child: child,
      // );
      // return FadeTransition(opacity: animation, child: child);
      // animation = CurvedAnimation(curve: Curves.easeOut, parent: animation);
      // return FadeTransition(
      //   opacity: animation,
      //   child: child,
      // );
    },
  );
}
