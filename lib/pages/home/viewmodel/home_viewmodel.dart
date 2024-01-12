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
  bool isAgeAdded = false; // Kontrol değişkeni

  late final ReactionDisposer _reaction;

  _HomeViewModelBase() {
    init();
    // Reaction'u başlat
    _reaction = reaction((_) => informationGetIt.birthDateController.text, (String newBirthDate) {
      // Yaş değeri daha önce eklenmediyse ve değiştiyse yeni yaş ekleyelim
      if (!isAgeAdded && newBirthDate != informationGetIt.birthDateController.text) {
        calculateAge();
      }
    });
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
      isAgeAdded = true; // Yaş değeri eklendiğinde kontrol değişkenini güncelle
    } catch (e) {
   
      age = 'Invalid Date';
    }
  }

  @action
  Future<void> init() async {
    await calculateAge();
  }

  // Dispose Reaction'u
  void dispose() {
    _reaction();
  }
}
