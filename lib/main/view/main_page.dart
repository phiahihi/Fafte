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

final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

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
      backgroundColor: Colors.grey,
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                backgroundColor: ColorsApp.colorTheme,
                bottom: TabBar(
                  unselectedLabelColor: ColorsApp.colorBorderButtonAndText,
                  controller: _tabController,
                  labelColor: ColorsApp.colorBorderButtonAndText,
                  indicatorColor: ColorsApp.colorBorderButtonAndText,
                  onTap: ((value) {
                    setState(() {
                      _tabController?.index = value;
                    });
                  }),
                  tabs: [
                    Tab(
                      height: SizesApp.s52,
                      icon: Icon(
                        _tabController!.index == 0
                            ? Icons.home
                            : Icons.home_outlined,
                        size: SizesApp.s32,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        _tabController!.index == 1
                            ? Icons.group
                            : Icons.group_outlined,
                        size: SizesApp.s32,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        _tabController!.index == 2
                            ? Icons.message
                            : Icons.message_outlined,
                        size: SizesApp.s32,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        _tabController!.index == 3
                            ? Icons.notifications
                            : Icons.notifications_outlined,
                        size: SizesApp.s32,
                      ),
                    ),
                    const Tab(
                      icon: Icon(
                        Icons.menu,
                        size: SizesApp.s32,
                      ),
                    ),
                  ],
                ),
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: SizesApp.s16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: SizesApp.s40,
                          ),
                          const SizedBox(
                            width: SizesApp.s8,
                          ),
                          Text(
                            'FAFTE',
                            style: FontsApp().fontBodyLarge.copyWith(
                                  color: ColorsApp.colorBorderButtonAndText
                                      .withOpacity(0.8),
                                  fontWeight: FontWeight.w500,
                                ),
                          )
                        ],
                      ),
                      Container(
                        width: SizesApp.s40,
                        height: SizesApp.s40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(SizesApp.s20),
                          color: ColorsApp.colorBorderButtonAndText
                              .withOpacity(0.1),
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: const Size(0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(SizesApp.s20),
                            ),
                          ),
                          child: Icon(
                            Icons.search_outlined,
                            color: ColorsApp.colorBorderButtonAndText,
                            size: SizesApp.s32,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
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
