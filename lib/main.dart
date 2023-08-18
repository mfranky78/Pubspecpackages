import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(title: const Text('Pubspecanimation Aufgabe 3')),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Animate(
                  effects: const [FadeEffect(), ScaleEffect()],
                  child: const Center(
                      child:
                          Text("Hello World!", style: TextStyle(fontSize: 20))),
                ),
                const SizedBox(
                  height: 20,
                ),
                //  -------------------------------------------------------------------------------------------
                const Text("Hello World!", style: TextStyle(fontSize: 20))
                    .animate()
                    .fade()
                    .scale(),
                const SizedBox(
                  height: 20,
                ),
                //  -------------------------------------------------------------------------------------------
                const Text("Hello", style: TextStyle(fontSize: 20))
                    .animate()
                    .fade(duration: 500.ms)
                    .scale(delay: 500.ms),
                const SizedBox(
                  height: 20,
                ),
                //  -------------------------------------------------------------------------------------------
                const Text("Hello World!", style: TextStyle(fontSize: 20))
                    .animate()
                    .fadeIn() // uses `Animate.defaultDuration`
                    .scale() // inherits duration from fadeIn
                    .move(
                        delay: 500.ms,
                        duration: 900.ms) // runs after the above w/new duration
                    .blurXY(
                        duration: const Duration(
                            seconds: 9)), // an opacity of 1 is "neutral"
                const SizedBox(
                  height: 20,
                ),
                //  -------------------------------------------------------------------------------------------
                const Text("Hello", style: TextStyle(fontSize: 20))
                    .animate()
                    .fade(), // begin=0, end=1
                const Text("Hello", style: TextStyle(fontSize: 20))
                    .animate()
                    .fade(begin: 0.4), // end=1
                const Text("Hello", style: TextStyle(fontSize: 20))
                    .animate()
                    .fade(end: 0.3),
                const Text('Hello', style: TextStyle(fontSize: 20)).animate().tint(
                    color: Colors
                        .purple), // begin=1 // inherits the delay & duration from move // runs after fade.
                const SizedBox(
                  height: 20,
                ),
                //  -------------------------------------------------------------------------------------------
                const Text("Hello", style: TextStyle(fontSize: 20))
                    .animate()
                    .fadeIn(duration: 900.ms)
                    .then(delay: 200.ms) // baseline=800ms
                    .slide(),
                Column(
                    children: AnimateList(
                  interval: 400.ms,
                  effects: [FadeEffect(duration: 300.ms)],
                  children: [
                    const Text("Hello", style: TextStyle(fontSize: 20)),
                    const Text("World", style: TextStyle(fontSize: 20)),
                    const Text("Goodbye", style: TextStyle(fontSize: 20))
                  ],
                )),
                const SizedBox(
                  height: 20,
                ),
                //  -------------------------------------------------------------------------------------------
                const Text("Hello World", style: TextStyle(fontSize: 20))
                    .animate()
                    .custom(
                        duration: 1300.ms,
                        builder: (context, value, child) => Container(
                              color: Color.lerp(Colors.red, Colors.blue, value),
                              padding: const EdgeInsets.all(8),
                              child: child,
                            )),
                const SizedBox(
                  height: 20,
                ),
                //  -------------------------------------------------------------------------------------------
                const Text(
                  "Horrible Pulsing Text",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                )
                    .animate(
                        onPlay: (controller) =>
                            controller.repeat(reverse: true))
                    .fadeOut(curve: Curves.easeInOut),
                Text("Hello").animate().fadeIn(duration: 1500.ms).callback(
                    duration: 500.ms, callback: (_) => print('halfway')),
                Text("Hello")
                    .animate()
                    .scale(delay: 400.ms, duration: 900.ms)
                    .callback(callback: (_) => print('scale is done')),
                
              ],
            )));
  }
}
