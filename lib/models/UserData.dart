import 'package:pocket_tasks/enums/enums.dart';

class UserData {
  String userName;
  Goal userGoal = Goal.unknown;
  PreferredMethod preferredMethod = PreferredMethod.unknown;

  UserData({
    required this.userName
  });
}
