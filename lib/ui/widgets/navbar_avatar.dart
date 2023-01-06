import 'package:flutter/material.dart';

class NavBarAvatar extends StatelessWidget {
  const NavBarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: const Image(
          image: NetworkImage(
              "https://sxprotection.com.au/wp-content/uploads/2016/07/team-placeholder.png"),
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
