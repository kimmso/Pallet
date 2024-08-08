import 'package:flutter_getx_palette_diary/src/controller/bottom_nav_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/calender_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/email_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/feed_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/home_controller.dart';

import 'package:flutter_getx_palette_diary/src/controller/postlist_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/user_controller.dart';
import 'package:flutter_getx_palette_diary/src/repository/calender_repository.dart';
import 'package:flutter_getx_palette_diary/src/repository/email_repository.dart';

import 'package:flutter_getx_palette_diary/src/repository/feed_repository.dart';

import 'package:flutter_getx_palette_diary/src/repository/postlist_repository.dart';
import 'package:flutter_getx_palette_diary/src/repository/user_repository.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(HomeController());
    // Get.put(PostController(repository: PostRepository()));
    Get.put(UserController(repository: UserRepository()));
    // Get.put(MyProfilController(repository: MyProfilRepository()));
    Get.put(FeedController(repository: FeedRepository()));
    Get.put(PostListController(repository: PostListRepository()));
    Get.put(CalenderDateController(repository: CalenderDateRepository()));
    Get.put(EmailController(repository: EmailRepository()));
  }
}
