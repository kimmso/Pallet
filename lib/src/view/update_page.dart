import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/app.dart';

import 'package:flutter_getx_palette_diary/src/controller/post_controller.dart';
import 'package:flutter_getx_palette_diary/src/model/post.dart';

import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';

import 'package:flutter_getx_palette_diary/src/widget/custom_textfield.dart';

import 'package:get/get.dart';

class UpdatePage extends GetView<PostController> {
  final String? photo_url;
  final String? content;
  final int? post_no;

  const UpdatePage({Key? key, this.photo_url, this.content, this.post_no})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('글 수정하기'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                Post? post = await controller.changepostfetchData(post_no!);
                print('사진 url 반환 성공');

                controller.changecontentFetchData(post, post_no!);
                Get.to(() => App());
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _image(),
          _sharebutton(),
          _text(),
        ],
      ),
    );
  }

  Widget _image() {
    return GestureDetector(
        onTap: controller.pickImageV02,
        child: Container(
          height: 400,
          width: 350,
          child: controller.file != null
              ? Image.file(
                  File(controller.file!.path),
                  fit: BoxFit.cover,
                )
              : photo_url != null
                  ? Image.network(
                      photo_url!,
                      fit: BoxFit.cover,
                    )
                  : const Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.white,
                    ),
        ));
  }

  Widget _text() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomTextField(
        controller: controller.content,
        hint: content ?? '', // 포스트 내용,

        validator: ValidatorUtil.validateContent,
      ),
    );
  }

  Widget _sharebutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('이 글을 다른 사람과 공유하겠습니까? ', style: TextStyle(fontSize: 16)),
        IconButton(
          onPressed: () {
            controller.updateCheckbox(!controller.shareCheck.value);
          },
          icon: Obx(() => controller.shareCheck.value
              ? const Icon(Icons.check_box_outlined)
              : const Icon(Icons.check_box_outline_blank)),
        ),
      ],
    );
  }
}
