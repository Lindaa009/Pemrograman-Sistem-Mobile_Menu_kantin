import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Roboto Mono dipilih agar nama menu dan harga terlihat tegas serta mudah dibaca.
// Warna hijau gelap menjaga kontras dengan latar pink dan menyatu dengan tema kedai.
class KantinText extends StatelessWidget {
  const KantinText(
    this.value, {
    super.key,
    this.size = 16,
    this.color = const Color(0xFF28332B),
    this.weight = FontWeight.normal,
    this.textAlign = TextAlign.start,
  });

  final String value;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      textAlign: textAlign,
      style: GoogleFonts.robotoMono(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
