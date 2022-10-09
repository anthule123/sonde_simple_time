import '../../models/data_layer.dart';
import 'package:flutter/material.dart';
import 'package:sonde_simple_time/doctor_provider.dart';
import '../patient_screen.dart';
import 'dart:math';

class PatientInformationReading extends StatefulWidget {
  Patient? patient;
  PatientInformationReading({super.key, this.patient});

  @override
  State<PatientInformationReading> createState() =>
      _PatientInformationReadingState();
}

class _PatientInformationReadingState extends State<PatientInformationReading> {
  Patient? get patient => widget.patient;
  final _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(patient!.name.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //1. Tên
            Text('1. Họ và tên: ${patient?.fullName}\n'),
            Text('2. Năm sinh: ${patient?.yearBorn}\n'),
            Text('3. Cân nặng: ${patient?.weight!.round()} kg\n'),
            Text('4. Chiều cao: ${patient?.height!.round()} cm\n'),
          ],
        ),
      ),
    );
  }
}
