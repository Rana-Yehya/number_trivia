import 'package:flutter/material.dart';
import 'injection.dart' as getIt;

void main() {
  getIt.configureInjection();
  runApp(const MainAppWidget());
}

class MainAppWidget extends StatelessWidget {
  const MainAppWidget({super.key});
	
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
	SizeConfig().init(context); 
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
	    primaryColor: Colors.green.shade800,
        accentColor: Colors.green.shade600,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NumberPage(),
    );
  }
}
