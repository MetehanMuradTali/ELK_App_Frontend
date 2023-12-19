import 'package:elk_frontend/core/sizes.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:elk_frontend/production/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = true;
  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      animate = false;
    });
    await Future.delayed(const Duration(milliseconds: 1200));
    //Navigate
    goToMain();
   
  }
  goToMain(){
     Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ));
  }
  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = context.getWidth;
    var height = context.getHeight;

    return Scaffold(
      backgroundColor: MainColors.color2,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            top: animate ? 0 : (height / 8),
            left: width / 4,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1200),
              opacity: animate ? 0 : 1,
              child: SizedBox(
                width: width / 2,
                height: height / 2,
                child: const Image(image: AssetImage(ImageStrings.splashImage)),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            bottom: animate ? 0 : (height / 4),
            left: width / 4,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1200),
              opacity: animate ? 0 : 1,
              child: SizedBox(
                width: width / 2,
                child: Center(
                  child: Text(
                    "ElasticSearch App",
                    style: GoogleFonts.roboto(
                        fontSize: width > 1000 ? 45 : 30,
                        color: MainColors.color3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
