//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// X|Y|Z & Dev
//
// Copyright Ⓒ Robert Mollentze, xyzand.dev
//
// Licensing details can be found in the LICENSE file in the root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/_common.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyStepsTabBar extends StatelessWidget {
  //
  //
  //

  final TabController tabController;
  final Iterable<MyTabBarPage> pages;

  //
  //
  //

  static Widget defaultIconBuilder({
    required BuildContext context,
    required int index,
    Widget? child,
  }) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: child ??
            Text(
              index.toString(),
              style: TextStyle(
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .inverted
                    .withSaturation(0.0),
                fontSize: 20.0,
              ),
            ),
      ),
    );
  }
  //
  //
  //

  const MyStepsTabBar({
    super.key,
    required this.tabController,
    required this.pages,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: const EdgeInsets.all(8.0),
      controller: this.tabController,
      onTap: (value) => this.tabController.animateTo(value),
      tabs: pages.mapi((page, index, _) {
        return Tab(
          text: page.page.title,
          icon: page.iconBuilder?.call(index) ??
              MyStepsTabBar.defaultIconBuilder(
                context: context,
                index: index,
              ),
        );
      }).toList(),
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class MyTabBarPage {
  //
  //
  //

  final ScreenPage page;
  final Widget? Function(int index)? iconBuilder;
  //
  //
  //

  const MyTabBarPage({
    required this.page,
    this.iconBuilder,
  });
}
