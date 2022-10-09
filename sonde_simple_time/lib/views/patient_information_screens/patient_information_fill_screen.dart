import '../../models/data_layer.dart';
import 'package:flutter/material.dart';
import 'package:sonde_simple_time/doctor_provider.dart';
import '../patient_screen.dart';
import 'dart:core';

class PatientInformationFill extends StatefulWidget {
  Patient? patient;
  PatientInformationFill({super.key, this.patient});

  @override
  State<PatientInformationFill> createState() => _PatientInformationFillState();
}

class _PatientInformationFillState extends State<PatientInformationFill> {
  Patient? get patient => widget.patient;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(patient!.name.toString()),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //1. Tên
              TextFormField(
                decoration: InputDecoration(labelText: '1. Họ và tên'),
                validator: (text) => text!.isEmpty ? 'Điền họ và tên.' : null,
                initialValue: patient!.fullName.toString(),
                onFieldSubmitted: (text) {
                  setState(() {
                    patient?.fullName = text.toString();
                  });
                },
              ),
              //1. Tên
              TextFormField(
                  decoration: InputDecoration(labelText: '2. Năm sinh'),
                  validator: (text) => text!.isEmpty ? 'Điền năm sinh.' : null,
                  initialValue: patient!.yearBorn.toString(),
                  onFieldSubmitted: (text) {
                    setState(() {
                      patient!.yearBorn = int.tryParse(text.toString())!;
                    });
                  }),
              TextFormField(
                  decoration: InputDecoration(labelText: '3. Cân nặng (kg)'),
                  validator: (text) => text!.isEmpty ? 'Điền cân nặng.' : null,
                  initialValue: patient!.weight.toString(),
                  onFieldSubmitted: (text) {
                    setState(() {
                      patient?.weight = double.tryParse(text.toString())!;
                    });
                  }),
              TextFormField(
                  decoration: InputDecoration(labelText: '4. Chiều cao (cm)'),
                  validator: (text) => text!.isEmpty ? 'Điền chiều cao.' : null,
                  initialValue: patient!.height.toString(),
                  onFieldSubmitted: (text) {
                    setState(() {
                      patient?.height = double.tryParse(text.toString())!;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
