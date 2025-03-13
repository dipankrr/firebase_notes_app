import 'package:flutter/material.dart';
import 'dart:async';


class GradientButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const GradientButton({required this.onPressed, required this.text, Key? key}) : super(key: key);

  @override
  _GradientButtonState createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _gradientOffset = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: false);

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {
          _gradientOffset = _animation.value;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Blurred Glow Effect
        Positioned(
          bottom: -10,
          child: Container(
            width: 160,
            height: 30,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF6D1B),
                  Color(0xFFFFEE55),
                  Color(0xFF5BFF89),
                  Color(0xFF4D8AFF),
                  Color(0xFF6B5FFF),
                  Color(0xFFFF64F9),
                  Color(0xFFFF6565),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [
                  _gradientOffset,
                  _gradientOffset + 0.1,
                  _gradientOffset + 0.2,
                  _gradientOffset + 0.3,
                  _gradientOffset + 0.4,
                  _gradientOffset + 0.5,
                  1.0,
                ],
              ),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 8,
                )
              ],
            ),
          ),
        ),
        // Main Button
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              width: 3,
              color: Colors.transparent,
            ),
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Color(0xFF121213),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 10,
                spreadRadius: 2,
              )
            ],
          ),
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [
                  Color(0xFFFF6D1B),
                  Color(0xFFFFEE55),
                  Color(0xFF5BFF89),
                  Color(0xFF4D8AFF),
                  Color(0xFF6B5FFF),
                  Color(0xFFFF64F9),
                  Color(0xFFFF6565),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [
                  _gradientOffset,
                  _gradientOffset + 0.1,
                  _gradientOffset + 0.2,
                  _gradientOffset + 0.3,
                  _gradientOffset + 0.4,
                  _gradientOffset + 0.5,
                  1.0,
                ],
              ).createShader(bounds);
            },
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              onPressed: widget.onPressed,
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'SpaceGrotesk',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
