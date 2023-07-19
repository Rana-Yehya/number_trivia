import 'package:flutter/material.dart';
import 'core/themes/size_config.dart';
import 'features/number_trivia/presentation/pages/number_page.dart';
import 'injection.dart' as getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getIt.configureInjection();
  runApp(const MainAppWidget());
}

class MainAppWidget extends StatelessWidget {
  const MainAppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple[800],
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NumberPage(),
    );
  }
}
