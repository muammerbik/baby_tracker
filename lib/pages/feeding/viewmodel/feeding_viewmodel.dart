import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'feeding_viewmodel.g.dart';

class FeedingViewModel = _FeedingViewModelBase with _$FeedingViewModel;

abstract class _FeedingViewModelBase with Store {
  @observable
  TextEditingController timeController = TextEditingController();
  @observable
  TextEditingController mlController = TextEditingController();
  @observable
  TextEditingController noteController = TextEditingController();
}
