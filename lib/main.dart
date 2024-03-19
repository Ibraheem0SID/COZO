import 'package:cozo/src/core/utils/supabase_info.dart';
import 'package:cozo/src/features/auth/presentation/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SupabaseInfo.url,
    anonKey: SupabaseInfo.anonKey,
  );

  runApp(const Cozo());
}

class Cozo extends StatelessWidget {
  const Cozo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: Colors.black)),
        scaffoldBackgroundColor: Colors.black,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Tajawal'),
      ),
      home: LoginScreen(),
    );
  }
}
