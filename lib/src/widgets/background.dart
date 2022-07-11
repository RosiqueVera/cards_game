import 'package:flutter/material.dart';
import 'package:memory_game/src/styles/assetImages.dart';
import 'package:memory_game/src/widgets/bottomMain.dart';

//!Background
//?Widget para mostrar el fondo de pantalla
class BackgroundWidget extends StatelessWidget {
  final Widget widget;

  const BackgroundWidget({required this.widget});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget,
            bottomMain(context),
          ],
        ),
      ),
    );
  }
}
