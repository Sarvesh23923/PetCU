import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class searchBar extends StatelessWidget {
   const searchBar({
    super.key,
    required this.hint,

  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
       margin: EdgeInsets.symmetric(horizontal: 30),
       child: TextField(
         decoration: InputDecoration(
           prefixIcon: Icon(
             Icons.search,
             color: Colors.black54
           ),
           contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
           fillColor: Colors.grey.withOpacity(0.15),
           filled: true,
           border: OutlineInputBorder(
             borderSide: BorderSide.none,
             borderRadius: BorderRadius.circular(15),
           ),
           hintText: hint,
           hintStyle: GoogleFonts.roboto(
             fontSize: screenHeight * 0.017,
           ),
         ),
         textAlignVertical: TextAlignVertical.center,
       ),
     );
  }
}

