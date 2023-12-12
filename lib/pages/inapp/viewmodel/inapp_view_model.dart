import 'package:mobx/mobx.dart';
part 'inapp_view_model.g.dart';

class InappViewModel = _InappViewModelBase with _$InappViewModel;

abstract class _InappViewModelBase with Store {

  @observable
   int selectedButtonIndex = 0;
}