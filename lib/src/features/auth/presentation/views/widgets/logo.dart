import 'package:cozo/src/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        width: 300,
        height: 200,
        child: Image.asset(
          AppAssets.whiteLogo,
        ),
      ),
    );
  }
}
