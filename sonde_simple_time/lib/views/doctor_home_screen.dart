import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import '../models/data_layer.dart';
import 'package:flutter/material.dart';
import 'package:sonde_simple_time/doctor_provider.dart';
import 'patient_screen.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  final textController = TextEditingController();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Danh sách bệnh nhân')),
      body: Column(children: <Widget>[
        _buildListCreator(),
        Expanded(child: _buildMasterPatients())
      ]),
    );
  }

  Widget _buildListCreator() {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Material(
          color: Theme.of(context).cardColor,
          elevation: 10,
          child: TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Thêm bệnh nhân',
                contentPadding: EdgeInsets.all(20),
              ),
              onEditingComplete: addPatient),
        ));
  }

  void addPatient() {
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }
    final patient = Patient()..name = text;
    DoctorProvider.of(context).add(patient);
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  _buildMasterPatients() {
    final patients = DoctorProvider.of(context);
    if (patients.isEmpty) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.note, size: 100, color: Colors.grey),
            Text('You do not have any plans yet.',
                style: Theme.of(context).textTheme.headline5)
          ]);
    }
    return ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final patient = patients[index];
          return ListTile(
              title: Text(patient.name.toString()),
              // subtitle: Text(p.completenessMessage),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => PatientScreen(patient: patient)));
              });
        });
  }
}
