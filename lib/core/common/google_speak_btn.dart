import 'package:flutter/material.dart';

class GoogleSpeakBtn extends StatefulWidget {
  final VoidCallback onTap;
  final bool isListening;

  const GoogleSpeakBtn({
    super.key,
    required this.onTap,
    this.isListening = false,
  });

  @override
  State<GoogleSpeakBtn> createState() => _GoogleSpeakBtnState();
}

class _GoogleSpeakBtnState extends State<GoogleSpeakBtn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _borderWidthAnim;
  late Animation<Color?> _borderColorAnim;
  late Animation<double> _glowAnim;
  // New animation for the border's opacity
  late Animation<double> _borderOpacityAnim;

  @override
  void initState() {
    super.initState();

    // 🚀 Key Change: Reduced duration for a quick appear/disappear effect
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200), // Much faster animation
    );

    // Animates the border width from thin to thick
    _borderWidthAnim = Tween<double>(begin: 2.0, end: 8.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Animates the glow radius
    _glowAnim = Tween<double>(begin: 0.0, end: 20.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Animates the base color
    _borderColorAnim = ColorTween(
      begin: Colors.redAccent.shade100,
      end: Colors.redAccent,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Animate opacity from 1.0 (fully visible) to 0.0 (fully transparent)
    _borderOpacityAnim = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(covariant GoogleSpeakBtn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isListening) {
      _controller.repeat(reverse: true); // animate border continuously
    } else {
      _controller.stop();
      _controller.reverse(from: 1.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          Color animatedBorderColor = _borderColorAnim.value!.withOpacity(
            _borderOpacityAnim.value,
          );
          return Container(
            width:70,
            height:70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: widget.isListening
                    ? animatedBorderColor // Use the color with animated opacity
                    : Colors.grey.shade400,
                width: widget.isListening ? _borderWidthAnim.value : 2,
              ),
              boxShadow: widget.isListening
                  ? [
                BoxShadow(
                  color: _borderColorAnim.value!.withOpacity(0.6),
                  blurRadius: 30,
                  spreadRadius: _glowAnim.value,
                ),
              ]
                  : [],
            ),
            child: Icon(
              widget.isListening ? Icons.mic_rounded : Icons.mic_none_rounded,
              color: widget.isListening ? Colors.redAccent : Colors.black87,
              size: 34,
            ),
          );
        },
      ),
    );
  }
}