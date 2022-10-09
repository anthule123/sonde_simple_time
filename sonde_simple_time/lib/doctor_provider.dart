import 'package:flutter/material.dart';
import './models/data_layer.dart';

class DoctorProvider extends InheritedWidget {
  final _patients = <Patient>[];
  DoctorProvider({Key? key, required Widget child})
      : super(key: key, child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
  static List<Patient> of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<DoctorProvider>();
    return provider!._patients;
  }
}
