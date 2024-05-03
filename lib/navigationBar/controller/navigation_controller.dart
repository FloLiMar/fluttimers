import 'package:dev/navigationBar/domain/navigation_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../countDownTimer/presentation/count_down_timers_widget.dart';
import '../../sequence/presentation/sequence_list_widget.dart';
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
          selectedIcon: const Icon(Icons.alarm_outlined),
          icon: const Icon(Icons.alarm),
          label: AppLocalizations.of(context)!.home,
        ),
        widget: const CountDownTimersWidget());

    settings = NavigationMapper(index: NavigationOrder.settings.index,
        navigationDestination: NavigationDestination(
          selectedIcon: const Icon(Icons.settings_outlined),
          icon: const Icon(Icons.settings),
          label: AppLocalizations.of(context)!.settings,
        ),
        widget: const SettingsWidget());

    sequenceList = NavigationMapper(index: NavigationOrder.sequenceList.index,
        navigationDestination: NavigationDestination(
          selectedIcon: const Icon(Icons.list_outlined),
          icon: const Icon(Icons.list),
          label: AppLocalizations.of(context)!.sequenceList,
        ),
        widget: const SequenceListWidget());
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