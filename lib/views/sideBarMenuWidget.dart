import 'package:flutter/material.dart';

class SideBarMenuWidget extends StatelessWidget {
  const SideBarMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(left: 30, top: 50, bottom: 50, right: 20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xff48BB68),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(1, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  "A",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                "anonym.nickname",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ListView(
              padding: EdgeInsets.only(top: 70),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                SideBarMenuItem(
                  image: AssetImage("images/icons/location_icon.png"),
                  title: "Map",
                  callback: () {
                    // TODO
                    print("map");
                  },
                ),
                SideBarMenuItem(
                  image: AssetImage("images/icons/groups_icon.png"),
                  title: "Groups",
                  callback: () {
                    // TODO
                    print("groups");
                  },
                ),
                SideBarMenuItem(
                  image: AssetImage("images/icons/notifications_icon.png"),
                  title: "Notifications",
                  callback: () {
                    // TODO
                    print("Notifications");
                  },
                ),
                SideBarMenuItem(
                  image: AssetImage("images/icons/profile_icon.png"),
                  title: "Profile",
                  callback: () {
                    // TODO
                    print("Profile");
                  },
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                // TODO
                print("Settings");
              },
              child: Text(
                "Settings",
                style: TextStyle(
                  color: Color(0xff595959),
                  fontSize: 20,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SideBarMenuItem extends StatelessWidget {
  final AssetImage image;
  final String title;
  Function callback;
  SideBarMenuItem({
    required this.title,
    required this.image,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        callback();
      },
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xff595959),
          fontSize: 22,
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: Image(
        image: image,
        width: 26,
      ),
    );
  }
}
