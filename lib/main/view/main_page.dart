import 'package:chat_app_b/constants/sizes.dart';
import 'package:chat_app_b/main/view/chat_page/view/chat_page.dart';
import 'package:chat_app_b/main/view/friend_page/view/friend_page.dart';
import 'package:chat_app_b/main/view/home_page/view/home_page.dart';
import 'package:chat_app_b/main/view/menu_page/view/menu_page.dart';
import 'package:chat_app_b/main/view/notification_page/view/notification_page.dart';

import '../../constants/colors.dart';
import '../../constants/fonts.dart';
import '../bloc/main_bloc.dart';
import '/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  void notifyUpdateIsFavourite() {
    setState(() {});
  }

  TabController? _tabController;
  ScrollController? _scrollViewController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _scrollViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<MainBloc>().add(MainEventFetch());
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                bottom: TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      icon: Icon(Icons.home),
                    ),
                    Tab(
                      icon: Icon(Icons.group),
                    ),
                    Tab(
                      icon: Icon(Icons.chat),
                    ),
                    Tab(
                      icon: Icon(Icons.notifications),
                    ),
                    Tab(
                      icon: Icon(Icons.menu),
                    ),
                  ],
                ),
                title: const Text('Tab controller'),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
              ),
            ),
          ];
        }),
        body: TabBarView(
          controller: _tabController,
          children: const [
            HomePage(),
            FriendPage(),
            ChatPage(),
            NotificationPage(),
            MenuPage(),
          ],
        ),
      ),
    );
  }
}
