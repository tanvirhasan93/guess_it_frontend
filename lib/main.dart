import 'package:flutter/material.dart';
import 'package:guess_it_frontend/core/router/app_router.dart';

import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.getTheme(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
