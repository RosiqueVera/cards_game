import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/src/styles/fonts.dart';

AnimatedTextKit animateText(
    {required String text1, double? fontSize, Color? color}) {
  return AnimatedTextKit(
    animatedTexts: [
      WavyAnimatedText(
        speed: const Duration(milliseconds: 150),
        text1,
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: fontSize ?? 16,
          fontFamily: sourceSansSemiBold,
        ),
      ),
    ],
    isRepeatingAnimation: true,
    repeatForever: true,
  );
}
