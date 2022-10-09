import 'package:flutter/material.dart';
import 'package:sonde_simple_time/models/data_layer.dart';
import 'package:google_fonts/google_fonts.dart';

class MediumRegimentGate extends StatefulWidget {
  Patient? patient;
  MediumRegimentGate({super.key, this.patient});

  @override
  State<MediumRegimentGate> createState() => _MediumRegimentGateState();
}

class _MediumRegimentGateState extends State<MediumRegimentGate> {
  Patient? get patient => widget.patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phác đồ vừa cho ${patient!.name} ')),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {
            ShowInfoRegiment(context);
          },
          child: Row(children: [Icon(Icons.info), Text(' Xem phác đồ')]),
        )
      ]),
    );
  }

  void ShowInfoRegiment(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Thông tin về phác đồ vừa'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '1. -	Tiêm dưới da insulin tác dụng chậm',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                    '+ liều khởi đầu: 0.2 UI/kg/ngày hoặc liều đang tiêm tại nhà hoặc 50% tổng liều insulin truyền tĩnh mạch/24h gần nhất'),
                Text(
                    '+ Glargine/ Detemir 1 lần/24h hoặc NPH 2 lần/ ngày cách nhau 12h'),
                SizedBox(height: 20),
                Text(
                  '2. Tiêm dưới da insulin tác dụng nhanh',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                _enum('+ 1UI novorapid cho mỗi 15g carbohydrate'),
                SizedBox(height: 20),
                Text(
                  '3. Theo dõi đường máu mao mạch trước mỗi lần ăn sonde, nếu',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                _enum(' 3.9 ≤ glucose ≤ 8.3: đạt mục tiêu'),
                _enum(' 8.3 < glucose ≤ 11.1: + 2UI novorapid'),
                _enum(' glucose > 11.1: +4UI novorapid'),
              ],
            ),
            actions: [
              TextButton(
                  child: Text('Đóng'),
                  onPressed: () => Navigator.of(context).pop())
            ],
          );
        });
  }

  Widget _enum(String text) => SizedBox(
          child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ));
}
