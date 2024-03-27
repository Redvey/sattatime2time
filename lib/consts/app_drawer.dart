import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:livesattabazar/consts/colors.dart';
import 'package:livesattabazar/consts/strings.dart';
import 'package:livesattabazar/dummy.dart';
import 'package:livesattabazar/provider/themes_provider.dart';
import 'package:livesattabazar/screens/about_us_page/about_us.dart';
import 'package:livesattabazar/screens/home_page/home.dart';
import 'package:livesattabazar/screens/settings_page/settings_page.dart';
import 'package:provider/provider.dart';


class CustomClipperForDrawer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..lineTo(0, size.height - 50)
      ..quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width,
        size.height - 50,
      )
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<ThemeProvider>(
        builder: (context, instance, _) {
          return ClipPath(
            clipper: CustomClipperForDrawer(),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: primaryColor,),
                  child: ListTile(
                    leading: const CircleAvatar(
                        child: Icon(CupertinoIcons.person)), // Prefix icon
                    title: const Text(
                      'Roopam',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    subtitle: const Text("User", style: TextStyle(
                      fontSize: 10,
                    ),),
                    trailing: IconButton(
                        onPressed: () {
                          instance.toggleTheme();
                        }, icon: Icon(
                      instance.isDark ? Icons.light_mode : Icons.dark_mode,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                    )),
                  ),
                ),

                ListTile(
                  title: Text(AppText.home.toUpperCase(),),
                  leading: const Icon(Icons.home), // Icon for dice game
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                ListTile(
                  title: Text(AppText.settings.toUpperCase()),
                  leading: const Icon(Icons.settings), // Icon for dice game
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsPage()),
                    );
                  },
                ),
                ListTile(
                  title: Text(AppText.share.toUpperCase()),
                  leading: const Icon(Icons.share), // Icon for dice game
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Dummy()),
                    );
                  },
                ),
                ListTile(
                  title: Text(AppText.aboutUs.toUpperCase()),
                  leading: const Icon(Icons.info), // Icon for dice game
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutUs()),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Divider(),
                ),
                ListTile(
                  title: Text(AppText.logOut.toUpperCase()),
                  leading: const Icon(Icons.logout), // Icon for dice game
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            AppText.logoutValidation,
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                          content: Text(
                            AppText.logoutValidation2,
                            style: TextStyle(
                              color: Theme.of(context).textTheme.bodyLarge!.color,
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text(
                                AppText.logoutNo,
                                style: TextStyle(
                                  color: Theme.of(context).textTheme.bodyLarge!.color,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                // Perform logout operation here
                                // For example, you can navigate to the login screen
                                Navigator.pushReplacementNamed(context, '/login');
                              },
                              child: Text(
                                AppText.logoutYes,
                                style: TextStyle(
                                  color: Theme.of(context).textTheme.bodyLarge!.color,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },


                ),

                // Other list tiles for additional options if needed
              ],
            ),
          );
        },
      ),
    );
  }
}







