import 'package:baby_tracker/get_it/get_it.dart';
import 'package:baby_tracker/pages/information/viewmodel/information_viewmodel.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'home_viewmodel.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final informationGetIt = locator<InformationViewModel>();

  @observable
  String age = '';

  _HomeViewModelBase() {
    init();
  }

  @action
  Future<void> calculateAge() async {
    try {
      DateTime birthDate = DateFormat('MM/dd/yyyy')
          .parse(informationGetIt.birthDateController.text);
      DateTime currentDate = DateTime.now();

      Duration difference = currentDate.difference(birthDate);

      int years = (difference.inDays / 365).floor();
      int months = ((difference.inDays % 365) / 30).floor();
      int days = (difference.inDays % 365) % 30;

      age = '$years Years $months Months $days Days';
    } catch (e) {
      print('Error calculating age: $e');
      age = 'Invalid Date';
    }
  }

  @action
  Future<void> init() async {
    await calculateAge();
  }
}
