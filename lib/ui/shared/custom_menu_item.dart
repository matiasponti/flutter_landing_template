import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMenuItem extends StatefulWidget {
  const CustomMenuItem(
      {Key? key,
      required this.text,
      required this.onPress,
      required this.delay})
      : super(key: key);

  final String text;
  final Function onPress;
  final Duration delay;

  @override
  _CustomMenuItemState createState() => _CustomMenuItemState();
}

bool isHover = false;

class _CustomMenuItemState extends State<CustomMenuItem> {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: widget.delay,
      from: 10,
      duration: Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: () => widget.onPress(),
        child: AnimatedContainer(
          margin: EdgeInsets.only(bottom: 10),
          duration: Duration(milliseconds: 300),
          width: 150,
          height: 40,
          color: Colors.black,
          child: Center(
            child: MouseRegion(
              onEnter: (_) => setState(() => isHover = !isHover),
              onExit: (_) => setState(() => isHover = !isHover),
              child: Text(
                widget.text,
                style: GoogleFonts.roboto(
                    fontSize: 20, color: isHover ? Colors.grey : Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
