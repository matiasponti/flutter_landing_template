import 'package:flutter/material.dart';
import 'package:flutter_scrollable_landing/providers/page_provider.dart';
import 'package:flutter_scrollable_landing/ui/shared/custom_menu_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  _CustomAppMenuState createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;

  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            _controller.reverse();
          } else {
            _controller.forward();
          }

          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTile(isOpen: isOpen, controller: _controller),
              if (isOpen) ...[
                CustomMenuItem(
                  text: 'Home',
                  onPress: () => pageProvider.goTo(0),
                  delay: Duration(milliseconds: 100),
                ),
                CustomMenuItem(
                    text: 'About',
                    onPress: () => pageProvider.goTo(1),
                    delay: Duration(milliseconds: 200)),
                CustomMenuItem(
                    text: 'Pricing',
                    onPress: () => pageProvider.goTo(2),
                    delay: Duration(milliseconds: 300)),
                CustomMenuItem(
                    text: 'Contact',
                    onPress: () => pageProvider.goTo(3),
                    delay: Duration(milliseconds: 400)),
                CustomMenuItem(
                    text: 'Location',
                    onPress: () => pageProvider.goTo(4),
                    delay: Duration(milliseconds: 100)),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    Key? key,
    required this.isOpen,
    required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final bool isOpen;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text(
            'Menu',
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
          ),
          Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
