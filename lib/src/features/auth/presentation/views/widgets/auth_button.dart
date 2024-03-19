import 'package:flutter/material.dart';

import '../../../../../core/utils/responsive.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    this.onPressed,
    required this.label,
    this.backgroundColor = Colors.black,
    this.iconPath,
  });

  final String label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(
              Size(Responsive.widthOfScreen(context: context, width: .8), 60),
            ),
            backgroundColor: MaterialStatePropertyAll(backgroundColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
            ),
            (iconPath != null)
                ? Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image.asset(iconPath!),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
