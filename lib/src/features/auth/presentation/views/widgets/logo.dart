import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Container(
        width: 200,
        height: 150,
        //child: Image.asset('asset/images/flutter-logo.png'),
      ),
    );
  }
}
