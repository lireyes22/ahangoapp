// ignore_for_file: avoid_unnecessary_containers
import 'package:ahangoapp/config/app_router.dart';
import 'package:ahangoapp/services/google_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends ConsumerState<SettingsView> {
  final GoogleAuthService _googleAuthService = GoogleAuthService();

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColorLight;
    Color colorSplash = Theme.of(context).primaryColorDark;
    return SizedBox(
        height: MediaQuery.of(context).size.height -90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(width: 1.0, color: Colors.black12),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(_googleAuthService.getUserInfo().photoURL),
                ),
                title: const Text('¡Hello traveler!'),
                subtitle: Text(_googleAuthService.getUserInfo().name),
              ),
            ),
            ButtonTiled(
              color: color,
              splashColor: colorSplash,
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              trailing: const Icon(Icons.arrow_forward_ios),
              bordes: const [15.0, 15.0, 0, 0],
              margin: const [20.0, 0.0],
              onTap: () {},
            ),
            ButtonTiled(
              color: color,
              splashColor: colorSplash,
              leading: const Icon(Icons.favorite_border_outlined),
              title: const Text('Favoritos'),
              trailing: const Icon(Icons.arrow_forward_ios),
              margin: const [20.0, 0.0],
              onTap: () {},
            ),
            ButtonTiled(
              color: color,
              splashColor: colorSplash,
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              trailing: const Icon(Icons.arrow_forward_ios),
              margin: const [20.0, 0.0],
              onTap: () {},
            ),
            ButtonTiled(
              color: color,
              splashColor: colorSplash,
              leading: const Icon(Icons.power_settings_new),
              title: const Text('Cerrar sesión'),
              trailing: const Icon(Icons.arrow_forward_ios),
              margin: const [20.0, 0.0],
              onTap: () {
                _googleAuthService.signOut();
                ref.read(appRouterProvider).push('/login');
              },
              bordes: const [0, 0, 15.0, 15.0],
            ),
          ],
        ),
      );
  }
}

class ButtonTiled extends StatelessWidget {
  final List<double> bordes;
  final GestureTapCallback onTap;
  final Color color;
  final Color? splashColor;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final double? height;
  final double width;
  final List<double> margin;

  const ButtonTiled(
      {super.key,
      required this.onTap,
      required this.color,
      this.splashColor,
      this.bordes = const [0, 0, 0, 0],
      this.leading,
      this.subtitle,
      this.trailing,
      this.height,
      this.width = double.infinity,
      this.margin = const [0.0, 0.0],
      this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: margin[0],
        vertical: margin[1],
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Material(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(bordes[0]),
              topRight: Radius.circular(bordes[1]),
              bottomLeft: Radius.circular(bordes[2]),
              bottomRight: Radius.circular(bordes[3])),
          child: InkWell(
            splashColor: splashColor ?? color.withOpacity(0.9),
            onTap: onTap,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(bordes[0]),
                topRight: Radius.circular(bordes[1]),
                bottomLeft: Radius.circular(bordes[2]),
                bottomRight: Radius.circular(bordes[3])),
            child: Container(
                child: ListTile(
              leading: leading,
              title: title,
              subtitle: subtitle,
              trailing: trailing,
            )),
          ),
        ),
      ),
    );
  }
}
