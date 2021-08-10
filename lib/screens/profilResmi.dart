import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class profilResmi extends StatelessWidget {
  const profilResmi({
    Key,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
            backgroundColor: Colors.grey[200],
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Colors.grey[350],
                  onPressed: () {},
                  child: SvgPicture.asset("assets/icons/Camera Icon.svg")),
            ),
          )
        ],
      ),
    );
  }
}
