import 'package:sonde_simple_time/views/beautiful_style.dart';
import 'package:sonde_simple_time/views/treatment_navigator/treatment_screen.dart';

import '../models/data_layer.dart';
import 'package:flutter/material.dart';
import 'package:sonde_simple_time/doctor_provider.dart';
import 'patient_information_screens/patient_information_fill_screen.dart';
import 'patient_information_screens/patient_information_reading.dart';
import 'doctor_home_screen.dart';
import 'treatment_navigator/yes_or_no_insulin_screen.dart';

class PatientScreen extends StatefulWidget {
  Patient? patient;
  PatientScreen({super.key, this.patient});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  Patient? get patient => widget.patient;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(patient!.name.toString()),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _fill_infoButton(context),
                _readInfoButton(context),
                _treatButton(),
                _resetTreatButton()
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _backToHomeButton(context),
    );
  }

  Widget _resetTreatButton() => Row(
        children: [
          ElevatedButton(
            style: ElegantButtonStyle(mainColor: Colors.orange.shade800),
            child: Text('Reset điều trị'),
            onPressed: () {
              patient!.CurrentTreatment = -1;
            },
          ),
        ],
      );

  Widget _treatButton() => Row(
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
            child: Text('Điều trị'),
            style: ElegantButtonStyle(mainColor: Colors.pink),
            onPressed: () async {
              await Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => TreatmentScreen(
                        patient: patient,
                      )));
            },
          ),
        ],
      );

  Widget _backToHomeButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.home),
      onPressed: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
      },
    );
  }

  Widget _readInfoButton(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElegantButtonStyle(mainColor: Colors.blue.shade800),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => PatientInformationReading(
                      patient: patient,
                    )));
          },
          child: Text('Xem thông tin bệnh nhân'),
        ),
      ],
    );
  }

  Widget _fill_infoButton(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElegantButtonStyle(mainColor: Colors.green.shade800),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => PatientInformationFill(
                      patient: patient,
                    )));
          },
          child: Text('Điền thông tin bệnh nhân'),
        ),
      ],
    );
  }
}
