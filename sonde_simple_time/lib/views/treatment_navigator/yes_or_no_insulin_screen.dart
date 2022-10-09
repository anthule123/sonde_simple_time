import 'package:sonde_simple_time/views/beautiful_style.dart';
import 'package:sonde_simple_time/views/medium_regiment_screens/medium_regiment_gate.dart';

import '../../models/data_layer.dart';
import 'package:flutter/material.dart';
import 'package:sonde_simple_time/doctor_provider.dart';
import '../light_regiment_screens/light_regiment_gate.dart';
import '../patient_information_screens/patient_information_fill_screen.dart';

class YesOrNoInsulinScreen extends StatefulWidget {
  Patient? patient;
  YesOrNoInsulinScreen({super.key, this.patient});

  @override
  State<YesOrNoInsulinScreen> createState() => _YesOrNoInsulinScreenState();
}

class _YesOrNoInsulinScreenState extends State<YesOrNoInsulinScreen> {
  Patient? get patient => widget.patient;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(patient!.name.toString())),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Bạn có đang tiêm insulin không?'),
          ElevatedButton(
            style: ElegantButtonStyle(mainColor: Colors.red.shade800),
            child: Text('Có'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => MediumRegimentGate(patient: patient)));
              setState(() {
                patient!.CurrentTreatment = 2;
              });
            },
          ),
          ElevatedButton(
            style: ElegantButtonStyle(mainColor: Colors.grey.shade800),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => LightRegimentGate(patient: patient)));
              setState(() {
                patient!.CurrentTreatment = 1;
              });
            },
            child: Text('Không'),
          ),
        ],
      ),
    );
  }
}
