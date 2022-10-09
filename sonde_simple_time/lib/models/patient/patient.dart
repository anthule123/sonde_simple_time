class Patient {
  double? height;
  double? weight;
  int yearBorn = 1980;
  bool complete = false;
  static const Healthy = -1;
  static const noInsulinInject = 0;
  String name = '';
  String fullName = '';
  int? id;
  Patient({
    this.height = 0,
    this.weight = 0,
    this.complete = false,
    this.name = '',
  });
  int CurrentTreatment = -1;

  // -1: chưa trả lời câu hỏi "Đã tiêm insulin chưa? "
  // 0: đã trả lời câu hỏi " "
  // 1:  đã trả lời câu hỏi " " và đang ở lộ trình nhẹ
  // 2: đã trả lời câu hỏi " " và đang ở lộ trình vừa
  // 3: đã trả lời câu hỏi " " và đang ở lộ trình nặng
}
