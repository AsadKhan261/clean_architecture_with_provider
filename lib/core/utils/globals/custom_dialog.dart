import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future showNavigationDialog(BuildContext context,
    {required String message,
      required String buttonText,
      required VoidCallback? navigation,
      required String secondButtonText,
      required bool showSecondButton}) async {
  showDialog(

      barrierDismissible: false,
      context: (context),
      builder: (context) {
        return Theme(
          data: ThemeData.dark(),
          child: CupertinoAlertDialog(

            title: Text(
              "Message",
              style: GoogleFonts.montserrat(color: Colors.green[900]),
            ),
            content: Text(message,style: GoogleFonts.montserrat(
              fontSize: 15,
              color: Colors.white,
            ),),
            actions: [
              if (showSecondButton == true)
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(secondButtonText,style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Colors.white,
                    ),)),
              TextButton(onPressed: () => navigation!(), child: Text(buttonText,style: GoogleFonts.montserrat(
                fontSize: 15,
                color: Colors.white,
              ),)),
            ],
          ),
        );
      });
}