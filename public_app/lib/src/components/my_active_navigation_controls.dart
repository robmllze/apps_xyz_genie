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

class MyActiveNavigationControls extends StatefulWidget {
  //
  //
  //

  const MyActiveNavigationControls({super.key});

  //
  //
  //

  @override
  State<MyActiveNavigationControls> createState() =>
      _MyActiveNavigationControlsState();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _MyActiveNavigationControlsState
    extends State<MyActiveNavigationControls> {
  //
  //
  //

  late var _selectedIndex = options.entries.toList().indexWhere(
        (e) =>
            app.routeManager.pScreenBreadcrumbs.value.first.configuration
                ?.path ==
            e.value.path,
      );

  final options = <String, ModelScreenConfiguration>{
    'Home': HomeScreenConfiguration(),
    'Options': OptionsScreenConfiguration(),
    'Generate Models': GenerateModelScreenConfiguration(),
    'Generate Screens': GenerateScreenScreenConfiguration(),
  };

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Builder(
                builder: (context) {
                  final selected = this._selectedIndex == 0;
                  return TextButton.icon(
                    style: ElevatedButton.styleFrom(
                      textStyle:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.bold,
                              ),
                      foregroundColor: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(selected ? 1.0 : 0.5),
                    ),
                    onPressed: () {
                      this.setState(() => this._selectedIndex = 0);
                      app.routeManager.go(options.values.elementAt(0));
                    },
                    icon: const MyAppIcon(),
                    label: const Text('Genie'),
                  );
                },
              ),
            ),
            VerticalDivider(
              width: 1.0,
              color: Theme.of(context).colorScheme.background,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: options.entries.skip(1).mapi(
                    (option, index, _) {
                      index = index + 1;
                      final label = option.key;
                      final configuration = option.value;
                      final selected = this._selectedIndex == index;
                      return TextButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(selected ? 1.0 : 0.5),
                        ),
                        onPressed: () {
                          this.setState(() => this._selectedIndex = index);
                          app.routeManager.go(configuration);
                        },
                        child: Text(label),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
