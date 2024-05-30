import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Create controller object to control 3D model.
    Flutter3DController controller = Flutter3DController();
    final animationController =
        useAnimationController(duration: const Duration(milliseconds: 2000));
    final tween = Tween<double>(begin: 0, end: 90);
    final animation = tween.animate(animationController);
    animationController.addListener(() {
      controller.setCameraOrbit(
        animation.value,
        animation.value,
        animation.value,
      );
    });

    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          animationController.forward();
        },
        child: const Text("Animate"),
      ),
      body: Center(
        child: SafeArea(
          child: Flutter3DViewer(
            progressBarColor: Colors.blue,
            controller: controller,
            src: 'assets/chicken.glb',
          ),
        ),
      ),
    );
  }
}
