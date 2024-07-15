import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/utils/get_itt.dart' as di;

import 'core/utils/my_bloc_observer.dart';
import 'my_app.dart';

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
