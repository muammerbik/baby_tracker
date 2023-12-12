import 'package:mobx/mobx.dart';
part 'diaper_viewmodel.g.dart';

enum DiaperStatus { Wet, Dirty, Mixed, Dry }

class DiaperViewModel = _DiaperViewModelBase with _$DiaperViewModel;

abstract class _DiaperViewModelBase with Store {

  @observable
  DiaperStatus? selectedStatus;


  @action
  void setSelectedStatus(DiaperStatus? status) {
    selectedStatus = status;

  }
}
