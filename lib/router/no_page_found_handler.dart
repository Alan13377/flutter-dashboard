import 'package:admin_dashboard/ui/views/page_404.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlers {
  static Handler noPageFoundHandlers = Handler(
    handlerFunc: (context, parameters) {
      return Page404();
    },
  );
}
