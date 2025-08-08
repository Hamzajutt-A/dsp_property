// import 'package:flutter/material.dart';
// import 'package:on_property/utils/colorscheme.dart';

// class CustomButton extends StatelessWidget {
//  final  Function()? callback;
//  final String? title;

//   CustomButton({this.callback, this.title});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: callback,
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10.0), color: primaryColor),
//         child: Center(
//             child: Text(
//           title!,
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
//         )),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:on_property/utils/colorscheme.dart';

class CustomButton extends StatelessWidget {
  final Function()? callback;
  final String? title;

  CustomButton({this.callback, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: 1,
              offset: Offset(0, 0), // Glow all around
            ),
          ],
        ),
        child: Center(
          child: Text(
            title ?? '',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
