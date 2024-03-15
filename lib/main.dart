import 'package:cozo/src/core/supabase.dart';
import 'package:cozo/src/features/splash/presentation/views/splash.dart';
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
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
