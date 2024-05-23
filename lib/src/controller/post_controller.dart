import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/model/post.dart';
import 'package:flutter_getx_palette_diary/src/repository/post_repository.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController {
  final Rxn<Post> _posts = Rxn<Post>();
  final Rxn<Post> _contents = Rxn<Post>();

  final Rxn<XFile?> _file = Rxn<XFile?>();

  late TextEditingController _content;
  final RxBool _share_check = false.obs;

  late String hint = "";

  TextEditingController get content => _content;
  RxBool get shareCheck => _share_check;
  XFile? get file => _file.value;

  get isDateSelected => null;

  // 체크박스 상태를 업데이트하는 함수
  void updateCheckbox(bool value) {
    _share_check.value = value;
  }

  final PostRepository repository;
  PostController({
    required this.repository,
  });

  static PostController get to => Get.find();

  Future<void> pickImageV02() async {
    ImagePicker().pickImage(source: ImageSource.gallery).then(
      (image) {
        if (image != null) {
          _file(image);
          _file.refresh();
        }
      },
    );
  }

  Future<Post?> postfetchData() async {
    final post = await repository.writeApi(file);
    if (post != null) {
      _posts.value = post;
      return post;
      Get.snackbar(
        "글쓰기 실패",
        ".",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }

  void postputData() {
    final post = {
      'content': _content.value.text,
    };
    repository.putPosts(post);
  }

  void contentFetchData(post) {
    final content = {
      'content': _content.value.text,
      'photo_url': post.photo_url,
      'share_check': _share_check.value == true,
    };

    repository.contentApi(content);
  }

  void contentPutData() {
    print('_share_check.value: ${_share_check.value}'); // 디버깅 메시지 추가

    final content = {
      'content': _content.value.text,
      'share_check': _share_check.value == true, // 문자열을 bool로 변환
    };
    repository.putContents(content);
  }

  void initTextField(String? hint) {
    _content = TextEditingController(text: hint ?? "");
  }

  Future<Post?> changepostfetchData(int post_no) async {
    final post = await repository.changeimageApi(file, post_no);
    if (post != null) {
      _posts.value = post;
      return post;
    } else {
      Get.snackbar(
        "글쓰기 실패",
        ".",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    }
  }

  void changecontentFetchData(post, int post_no) {
    final content = {
      'content': _content.value.text,
      'photo_url': post.photo_url,
      'share_check': _share_check.value == true,
    };

    repository.changecontentApi(content, post_no);
  }
}
