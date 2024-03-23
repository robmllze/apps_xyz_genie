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

part of 'generate_screen_screen.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _View extends TGenerateScreenScreenView
    with SingleTickerProviderStateMixin {
  //
  //
  //

  late final _tabController = TabController(
    length: this._pages.length,
    vsync: this,
  );

  late final _pages = [
    MyTabBarPage(page: GenerateScreenPage1(screenState: this)),
    MyTabBarPage(page: GenerateScreenPage2(screenState: this)),
    MyTabBarPage(page: GenerateScreenPage3(screenState: this)),
  ];

  //
  //
  //

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        MyStepsTabBar(
          tabController: this._tabController,
          pages: this._pages,
        ),
        Expanded(
          child: TabBarView(
            controller: this._tabController,
            children: this
                ._pages
                .map(
                  (e) => SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 16.0,
                        bottom: 64.0,
                      ),
                      child: e.page,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
