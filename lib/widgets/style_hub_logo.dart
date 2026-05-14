import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleHubLogo extends StatelessWidget {
  final double size;
  final bool showText;
  
  const StyleHubLogo({
    super.key, 
    this.size = 60,
    this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'S',
              style: GoogleFonts.playfairDisplay(
                fontSize: size,
                fontWeight: FontWeight.w900,
                color: const Color(0xFFF57C00),
                fontStyle: FontStyle.italic,
              ),
            ),
            Positioned(
              left: size * 0.15,
              child: Text(
                'H',
                style: GoogleFonts.playfairDisplay(
                  fontSize: size * 0.8,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xFFD32F2F).withValues(alpha: 0.9),
                ),
              ),
            ),
          ],
        ),
        if (showText) ...[
          const SizedBox(height: 4),
          Text(
            'STYLE HUB',
            style: GoogleFonts.inter(
              fontSize: size * 0.2,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
              color: Colors.black,
            ),
          ),
        ],
      ],
    );
  }
}
