import 'package:sonde_simple_time/views/light_regiment_screens/light_regiment_gate.dart';
import 'package:sonde_simple_time/views/treatment_navigator/yes_or_no_insulin_screen.dart';

import '../../models/data_layer.dart';
import 'package:flutter/material.dart';
import 'package:sonde_simple_time/doctor_provider.dart';
import '../beautiful_style.dart';
import '../medium_regiment_screens/medium_regiment_gate.dart';
import '../patient_information_screens/patient_information_fill_screen.dart';

class TreatmentScreen extends StatefulWidget {
  Patient? patient;
  TreatmentScreen({super.key, this.patient});

  @override
  State<TreatmentScreen> createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  Patient? get patient => widget.patient;
  @override
  void initState() {
    _treatment(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Điều trị cho ${patient!.name.toString()}')),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _treatment(context),
          ]),
    );
  }

  Widget _treatment(BuildContext context) {
    var state = patient!.CurrentTreatment;
    if (state == -1) {
      return Column(
        children: [
          Text('Bước 1: Hỏi xem đã tiêm insulin chưa'),
          TextButton(
            style: ElegantButtonStyle(),
            child: (Text('Chuyển tiếp')),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => YesOrNoInsulinScreen(patient: patient),
              ));
            },
          ),
        ],
      );
    } else if (state == 1) {
      return Column(
        children: [
          Text('Bạn đang ở phác đồ nhẹ'),
          TextButton(
            style: ElegantButtonStyle(),
            child: (Text('Chuyển tiếp')),
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => LightRegimentGate(patient: patient),
              ));
            },
          ),
        ],
      );
    } else if (state == 2) {
      return Column(
        children: [
          Text('Bạn đang ở phác đồ vừa'),
          TextButton(
            style: ElegantButtonStyle(),
            child: (Text('Chuyển tiếp')),
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => MediumRegimentGate(patient: patient),
              ));
            },
          ),
        ],
      );
    }
    return Text('Bạn đã khỏi bệnh');
  }
}
