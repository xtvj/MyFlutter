import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../provider/user_info_provider.dart';
import '../settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Offstage(
            offstage: _currentIndex != 0,
            child: TickerMode(
              enabled: _currentIndex == 0,
              child: const MaterialApp(
                home: Text("第一页"),
                title: "首页",
              ),
            ),
          ),
          Offstage(
            offstage: _currentIndex != 1,
            child: TickerMode(
              enabled: _currentIndex == 1,
              child: const MaterialApp(
                home: Text("第二页"),
                title: "设备",
              ),
            ),
          ),
          Offstage(
            offstage: _currentIndex != 2,
            child: TickerMode(
              enabled: _currentIndex == 2,
              child: MaterialApp(
                home: ChangeNotifierProvider(
                  create: (context) => UserInfoProvider(),
                  child: const SettingsPage(),
                ),
                title: "我的",
              ),
            ),
          ),
        ]),
        bottomNavigationBar: NavigationBar(
            selectedIndex: _currentIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            onDestinationSelected: (int index) async {
              setState(() {
                _currentIndex = index;
              });
              // 每当更改选项卡时刷新数据
              // if (_currentIndex == 0) {
              //   await _tabOneKey.currentState!.onTabChange();
              // }
              // if (_currentIndex == 1) {
              //   await _tabKey.currentState!.onTabChange();
              // }
              // if (_currentIndex == 2) {
              //   await _tabKey.currentState!.onTabChange();
              // }
            },
            destinations: [
              NavigationDestination(label: "首页", icon: SvgPicture.asset('assets/svg/icon_home.svg')),
              NavigationDestination(label: "设备", icon: SvgPicture.asset('assets/svg/icon_device.svg')),
              NavigationDestination(label: "我的", icon: SvgPicture.asset('assets/svg/icon_me.svg')),
            ]));
  }
}
