import 'package:pocket_tasks/enums/enums.dart';

class UserData {
  String userName;
  Goal userGoal = Goal.productivity;
  PreferredMethod preferredMethod = PreferredMethod.traditional;

  UserData({
    required this.userName
  });
}
