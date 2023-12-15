// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CalenderModel {
  String id;
  DateTime history;
  String catagori;
  String created;
  CalenderModel({
    required this.id,
    required this.history,
    required this.catagori,
    required this.created,
  });
}
/*
class CalenderModel {
  final DateTime date;
  final String category;
  final String created;

  CalenderModel({
    required this.date,
    required this.category,
    required this.created,
  });
}*/