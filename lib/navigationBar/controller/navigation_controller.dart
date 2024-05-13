import 'package:dev/navigationBar/domain/navigation_mapper.dart';
import 'package:dev/sequence/presentation/sequence_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../countDownTimer/presentation/count_down_timers_widget.dart';
import '../../settings/presentation/settings_widget.dart';

enum NavigationOrder {home, sequenceList, settings}

class NavigationController  {
  final BuildContext context;
  late NavigationMapper home;
  late NavigationMapper settings;
  late NavigationMapper sequenceList;

  NavigationController({required this.context}) {
    home = NavigationMapper(index: NavigationOrder.home.index,
        navigationDestination: NavigationDestination(
          icon: const Icon(Icons.alarm),
          label: AppLocalizations.of(context)!.home,
        ),
        widget: const CountDownTimersWidget());

    settings = NavigationMapper(index: NavigationOrder.settings.index,
        navigationDestination: NavigationDestination(
          icon: const Icon(Icons.settings),
          label: AppLocalizations.of(context)!.settings,
        ),
        widget: const SettingsWidget());

    sequenceList = NavigationMapper(index: NavigationOrder.sequenceList.index,
        navigationDestination: NavigationDestination(
          icon: const Icon(Icons.list),
          label: AppLocalizations.of(context)!.sequenceList,
        ),
        widget: const SequenceWidget());
  }

  List<NavigationMapper> getNavigationMapperList() {
    List<NavigationMapper> navigationMapperList = [home, settings, sequenceList];
    navigationMapperList.sort((navigationMapperA, navigationMapperB) => navigationMapperA.index.compareTo(navigationMapperB.index));
    return navigationMapperList;
  }

  List<NavigationDestination> getNavigationDestinationList() {
    return getNavigationMapperList().map((navigationMapper) => navigationMapper.navigationDestination).toList();
  }

  List<Widget> getWidgetList() {
    return getNavigationMapperList().map((navigationMapper) => navigationMapper.widget).toList();
  }
}