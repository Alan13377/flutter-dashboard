import 'package:admin_dashboard/ui/views/page_404.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(handlerFunc: (context, params) {
    return const Page404();
  });
}
