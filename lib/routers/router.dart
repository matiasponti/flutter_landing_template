import 'package:fluro/fluro.dart';
import 'package:flutter_scrollable_landing/routers/router_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define('/:page', handler: homeHandler);

    // 404

    router.notFoundHandler = homeHandler;
  }
}
