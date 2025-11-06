import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rolex_boutique/pages/main_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background
      backgroundColor: Color(0xFF0b4f3a),

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
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFcaa94a),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Color(0xFF0b4f3a),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
