import 'package:flutter/material.dart';
import 'package:route_task/features/Home%20Layout/data/models/products_model.dart';
import 'package:route_task/features/Home%20Layout/presentation/pages/details_page.dart';
import 'package:route_task/features/Home%20Layout/presentation/pages/products_list_screen.dart';

import '../../core/utils/app_strings.dart';
import '../../core/utils/app_styles.dart';
import '../core/utils/app_animations.dart';
import '../features/splach_page.dart';

class Routes {
  static const String splach = '/';
  static const String productScreen = 'productScreen';
  static const String productsListScreen = 'productlistScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.productScreen:
        {
          final args = settings.arguments as Map<String, dynamic>;
          final i = args['product'] as Products;
          return TopRouting(ProductDetails(i));
        }

      case Routes.splach:
        {
          return MaterialPageRoute(builder: (_) => const SplachScreen());
        }
      case Routes.productsListScreen:
        {
          return MaterialPageRoute(builder: (_) => const ProductsListScreen());
        }

      default:
        return unDefinedScreen();
    }
  }

  static Route<dynamic> unDefinedScreen() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(
                  AppStrings.noRoute,
                  style: AppStyles.titleStyle,
                ),
              ),
              body: Center(
                child: Text(
                  AppStrings.noRoute,
                  style: AppStyles.titleStyle,
                ),
              ),
            ));
  }
}
