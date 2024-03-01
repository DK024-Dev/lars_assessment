import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_assesment/src/core/configuration.dart';
import 'package:infinite_list_assesment/src/core/locator.dart';
import 'package:infinite_list_assesment/src/core/providers.dart';
import 'src/design/home.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Locator.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp(
        title: 'INFINITE LIST ASSESMENT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: const Home(),
      ),
    );
  }
}
