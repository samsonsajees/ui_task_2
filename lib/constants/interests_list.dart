import 'package:ui_task_2/models/interest_model.dart';

class InterestsList {
  InterestsList._();

  static final List<Interest> interests = [
    Interest(title: "User Interface"),
    Interest(title: "User Experience"),
    Interest(title: "User Research"),
    Interest(title: "UX Writing"),
    Interest(title: "User Testing"),
    Interest(title: "Service Design"),
    Interest(title: "Strategy"),
    Interest(title: "Design Systems"),
  ];

  static List<Interest> get selectedInterests => 
      interests.where((i) => i.isSelected).toList();
}