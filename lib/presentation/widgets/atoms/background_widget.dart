import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.child,
    required this.backgroundAsset,
  });

  final Widget child;
  final String backgroundAsset;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              backgroundAsset,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(child: child),
        ],
      );
}
