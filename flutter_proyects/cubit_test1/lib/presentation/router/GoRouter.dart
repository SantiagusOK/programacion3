import 'package:cubit_test1/presentation/screens/page1.dart';
import 'package:cubit_test1/presentation/screens/page2.dart';
import 'package:cubit_test1/presentation/screens/pageMenu.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const PaginaMenu()),
  GoRoute(path: "/lista", builder: (context, state) => const PaginaName()),
  GoRoute(path: "/crear", builder: (context, state) => const PaginaCrear())
]);
