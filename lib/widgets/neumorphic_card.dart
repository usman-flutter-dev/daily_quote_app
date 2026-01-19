import 'package:flutter/material.dart';

class NeumorphicCard extends StatefulWidget {
  final Widget child;
  const NeumorphicCard({super.key, required this.child});

  @override
  State<NeumorphicCard> createState() => _NeumorphicCardState();
}

class _NeumorphicCardState extends State<NeumorphicCard> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    // Neumorphic colors
    const Color baseColor = Color(0xFFE0E5EC);

    return GestureDetector(
      // Jab user touch kare
      onTapDown: (_) => setState(() => isPressed = true),
      // Jab user ungli utha le ya cancel kare
      onTapUp: (_) => setState(() => isPressed = false),
      onTapCancel: () => setState(() => isPressed = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150), // Smooth transition
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isPressed
              ? [
                  // Pressed State: Shadows flip ho jati hain (Inner shadow effect)
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(5, 5),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    offset: const Offset(-5, -5),
                    blurRadius: 10,
                  ),
                ]
              : [
                  // Normal State: Standard Neumorphism
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    offset: const Offset(5, 5),
                    blurRadius: 10,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, -5),
                    blurRadius: 10,
                  ),
                ],
        ),
        child: widget.child,
      ),
    );
  }
}
