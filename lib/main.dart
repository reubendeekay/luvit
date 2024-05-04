import 'package:flutter/material.dart';
import 'package:luvit/providers/dating_provider.dart';
import 'package:luvit/theme.dart';

import 'package:luvit/widgets/custom_nav_bar.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DatingProvider()),
      ],
      child: MaterialApp(
        title: 'Luvit',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const CustomNavBar(),
      ),
    );
  }
}
