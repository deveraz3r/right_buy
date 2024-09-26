import 'package:flutter/material.dart';

class TypingText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final Duration typingDuration;

  TypingText({
    required this.text,
    required this.style,
    this.typingDuration = const Duration(milliseconds: 100),
  });

  @override
  _TypingTextState createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;
  late String _displayedText;

  @override
  void initState() {
    super.initState();

    _displayedText = '';
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.text.length * widget.typingDuration.inMilliseconds),
    )..addListener(() {
      setState(() {
        _displayedText = widget.text.substring(0, _animation.value);
      });
    });

    _animation = IntTween(begin: 0, end: widget.text.length).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: widget.style,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
