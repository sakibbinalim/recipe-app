import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:recipe_app/pages/bottom_nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      Get.off(BottomNav());
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/splash_screen.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Positioned.fill(
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    'Savory & Sweet',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 120,
                  backgroundColor: Color(0xFF00b4bf),
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: ClipOval(
                      child: Image(
                        image: AssetImage('assets/images/chorizo.png'),
                        fit: BoxFit.cover,
                        height: 230,
                        width: 230,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
