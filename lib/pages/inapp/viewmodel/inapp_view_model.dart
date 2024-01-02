import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'inapp_view_model.g.dart';

class InappViewModel = _InappViewModelBase with _$InappViewModel;

abstract class _InappViewModelBase with Store {
  @observable
  int selectedButtonIndex = -1;

  @observable
  bool isInappComplated = false;


  

  @action
  Future<void> InappComplatedSet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool("isInappComplated", true);
    isInappComplated = true;
  }

  @action
  Future<void> InappComplatedGet() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isInappComplated = pref.getBool("isInappComplated") ?? false;
  }
}
