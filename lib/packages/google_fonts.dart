

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsPage extends StatefulWidget {
  const GoogleFontsPage({super.key});

  @override
  State<GoogleFontsPage> createState() => _GoogleFontsPageState();
}

class _GoogleFontsPageState extends State<GoogleFontsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Fonts')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Yazi', style: TextStyle(fontSize: 30, fontFamily:'Lato',fontStyle: FontStyle.italic),
            ),
            const Text('Yazi', style: TextStyle(fontSize: 30),
            ),
             Text('Yazi',style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 30,fontStyle: FontStyle.italic ),),  ),
            Text('Yazi',style: GoogleFonts.getFont('Lato', fontSize: 30, fontStyle: FontStyle.italic),  ),
          ],
        ),
      ),
    );
  }
}
