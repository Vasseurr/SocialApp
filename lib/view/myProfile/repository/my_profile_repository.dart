import 'package:social_app/view/myProfile/service/base/my_profile_base_service.dart';
import 'package:social_app/view/myProfile/service/my_profile_service.dart';

class MyProfileRepository extends MyProfileBaseService {
  final MyProfileService _myProfileService;

  MyProfileRepository(this._myProfileService);
}
