import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rolex_boutique/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:slide_to_act/slide_to_act.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        // background
        backgroundColor: const Color(0xFF0b4f3a),

        // body content
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // content of the Column
              children: [
                // emblem
                SvgPicture.asset(
                  'lib/images/emblems/rolex_crown.svg',
                  height: 240.0,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),

                const SizedBox(height: 48),

                // title
                const Text(
                  "Rolex Boutique Partner",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFFF7F5F0),
                  ),
                ),

                const SizedBox(height: 28),

                // sub title
                const Text(
                  "Authentic timepieces, official servicing, exclusive access.",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color(0xFFcfcab3),
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 48),

                // getting started button
                SlideAction(
                  onSubmit: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('seen', true);
                    if (!context.mounted) return;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                  innerColor: const Color(0xFF0b4f3a),
                  outerColor: const Color(0xFFcaa94a),
                  sliderButtonIcon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF0b4f3a),
                  ),
                  text: "Get Started",
                  textStyle: const TextStyle(
                    color: Color(0xFF0b4f3a),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
