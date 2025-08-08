 
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:on_property/utils/colorscheme.dart';

class GlowingTextField extends StatefulWidget {
  final String? hint;
  final Icon? icon;

  const GlowingTextField({Key? key, this.hint, this.icon}) : super(key: key);

  @override
  _GlowingTextFieldState createState() => _GlowingTextFieldState();
}

class _GlowingTextFieldState extends State<GlowingTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final isPassword = widget.hint == 'Enter Password';

    return GlowContainer(
      glowColor: primaryColor.withOpacity(0.3),
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xfff5f6f6),
      blurRadius: 15,
      spreadRadius: 1,

      child: TextField(
        obscureText: isPassword ? _obscureText : false,
        autocorrect: false,
        cursorColor: primaryColor,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: const Color(0xfff5f6f6),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () => setState(() => _obscureText = !_obscureText),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
