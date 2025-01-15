import 'package:ahangoapp/widgets/floating_button.dart';
import 'package:ahangoapp/widgets/svg_asset.dart';
import 'package:ahangoapp/home/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;
  String svgMenu = 'assets/svgs/menu.svg';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Theme.of(context).cardColor,
            child: const SvgAsset('assets/svgs/notifications.svg')),
        floatingActionButtonLocation: CustomFloatingActionButtonLocation(),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
        bottomNavigationBar: CurvedNavigationBar(
          color: Theme.of(context).cardColor,
          buttonBackgroundColor: Theme.of(context).primaryColorLight,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: [
            CurvedNavigationBarItem(
              child: const SvgAsset('assets/svgs/home.svg'),
              label: 'Home',
              labelStyle: TextStyle(color: Theme.of(context).iconTheme.color),
            ),
            CurvedNavigationBarItem(
              child: const SvgAsset('assets/svgs/route.svg'),
              label: 'Itinerario',
              labelStyle: TextStyle(color: Theme.of(context).iconTheme.color),
            ),
            /* CurvedNavigationBarItem(
              child: const SvgAsset('assets/svgs/play.svg'),
              label: 'Shorts',
              labelStyle: TextStyle(color: Theme.of(context).iconTheme.color),
            ), */
            CurvedNavigationBarItem(
              child: SvgAsset(svgMenu),
              label: 'Configuración',
              labelStyle: TextStyle(color: Theme.of(context).iconTheme.color),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              if (index == 3) {
                svgMenu = 'assets/svgs/menu_open.svg';
              } else {
                svgMenu = 'assets/svgs/menu.svg';
              }
            });
          },
        ),
        body: SafeArea(
            child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            [
              const HomeView(),
              const ItinerarioView(),
              //const ShortsView(),
              const SettingsView()
            ][_currentIndex],
          ],
        )));
  }
}
/**
 * SafeArea(
            child: <Widget>[
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: const <Widget>[
              HomeView(),
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: const <Widget>[
              ItinerarioView(),
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: const <Widget>[
              ShortsView(),
            ],
          ),
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: const <Widget>[
              SettingsView(),
            ],
          ),
        ][_currentIndex])
 */