import 'package:elk_frontend/production/others/constants/project_doubles.dart';
import 'package:elk_frontend/production/others/constants/project_strings.dart';
import 'package:elk_frontend/production/others/decorations/custom_styles.dart';
import 'package:elk_frontend/production/others/decorations/project_colors.dart';
import 'package:elk_frontend/production/presentation/pages/ip_status_page/ip_status_page.dart';
import 'package:elk_frontend/production/presentation/pages/search_page/search_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  bool isExtended = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.color2,
      appBar: AppBar(
        backgroundColor: MainColors.color5,
        title: const Center(child: Text(MainStrings.mainTitle)),
      ),
      body: Row(children: <Widget>[
        NavigationRail(
          backgroundColor: MainColors.color1,
          groupAlignment: -0.2,
          selectedIndex: _selectedIndex,
          elevation: 15,
          useIndicator: true,
          extended: isExtended,
          leading: IconButton(
              onPressed: () {
                setState(() {
                  isExtended = !isExtended;
                });
              },
              iconSize: MainDoubles.iconFontSize,
              icon: isExtended
                  ? const Icon(Icons.arrow_circle_left_rounded,
                      color: MainColors.color3)
                  : const Icon(Icons.arrow_circle_right_rounded,
                      color: MainColors.color3)),
          labelType: NavigationRailLabelType.none,
          minExtendedWidth: 175,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: [
            NavigationRailDestination(
              icon: const Icon(Icons.search, color: MainColors.color3),
              label: Text('Search Page', style: MainStyles.whiteHeaderStyle),
            ),
            NavigationRailDestination(
              icon: const Icon(Icons.priority_high_rounded,
                  color: MainColors.color3),
              label: Text(
                'Ip Status',
                style: MainStyles.whiteHeaderStyle,
              ),
            ),
          ],
        ),
        Expanded(child: _getPage(_selectedIndex)),
      ]),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const SearchPage();
      case 1:
        return const IpStatusPage();
      default:
        return const SearchPage();
    }
  }
}
