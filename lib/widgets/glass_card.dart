import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GlassMorphicTiltCard extends StatefulWidget {
  final Widget child;
  const GlassMorphicTiltCard({super.key, required this.child});

  @override
  State<GlassMorphicTiltCard> createState() => _GlassMorphicTiltCardState();
}

class _GlassMorphicTiltCardState extends State<GlassMorphicTiltCard> {
  // Sensor data variables
  double x = 0.0; // Horizontal tilt
  double y = 0.0; // Vertical tilt
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    // Accelerometer listen karna shuru karte hain
    _subscription = accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        // Hum values ko limit (clamp) kar rahe hain taake card zyada bahar na nikal jaye
        x = event.x.clamp(-5, 5);
        y = event.y.clamp(-5, 5);
      });
    });
  }

  @override
  void dispose() {
    // Memory leak se bachne ke liye subscription band karna zaroori hai
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      // Matrix4.identity() ko 3D transformation ke liye use karte hain
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002) // Perspective depth (3D effect ki gehrai)
        ..rotateX(y * 0.05) // X-axis par rotation
        ..rotateY(x * 0.05), // Y-axis par rotation
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          // Glass effect ka asli jaadu yahan hai (Blur)
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            decoration: BoxDecoration(
              // Bohat halki opacity
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1.5,
                // Kinaro ki chamak (Stroke)
                color: Colors.white.withValues(alpha: 0.2),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withValues(alpha: 0.2),
                  Colors.white.withValues(alpha: 0.05),
                ],
              ),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
