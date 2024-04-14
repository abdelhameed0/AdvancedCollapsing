import 'package:flutter/material.dart';

import 'controllers/telegram_controller.dart';
import 'telegram_constants/telegram_constants.dart';
import 'widgets/container_divider_widget.dart';
import 'widgets/notifications_widget.dart';
import 'widgets/persistent_profile_header.dart' show PersistentProfileHeader;
import 'widgets/profile_info_widget.dart' show ProfileInfoWidget;

class TelegramView extends StatefulWidget {
  const TelegramView({super.key});

  @override
  TelegramViewState createState() => TelegramViewState();
}

class TelegramViewState extends State<TelegramView>
    with SingleTickerProviderStateMixin {
  late TelegramScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = TelegramScrollController(initialOffset: initialScrollOffset);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateToMaxExtent();
      scrollController.controller.position.isScrollingNotifier
          .addListener(scrollController.handleScrollingActivity);
      /// Uncomment the following code to see the animation in action
      // scrollController.controller.addListener(() {
      //   setState(() {
      //     scrollController.handleScrollingActivity();
      //   });
      // });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController.controller,
        slivers: [
          SliverPersistentHeader(
              delegate: PersistentProfileHeader(), pinned: true),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileInfoWidget(),
                const Divider(
                  indent: leftPadding,
                  color: Colors.black,
                  thickness: 0.8,
                  height: 10,
                ),
                const NotificationsWidget(),
                const ContainerDividerWidget(),
                ...List.generate(10, (index) => const ProfileInfoWidget())
              ],
            ),
          ),
          // PersistentTabsWidget(),
          // CustomGridWidget(),
        ],
      ),
    );
  }
}
