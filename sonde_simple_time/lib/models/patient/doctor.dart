import 'patient.dart';

class Doctor {
  String name = '';
  final List<Patient> patients = [];
  int get completeCount => patients.where((patient) => patient.complete).length;
  String get completenessMessage =>
      '$completeCount out of ${patients.length} tasks';
  void add(Patient patient) {
    patients.add(patient);
  }
}
