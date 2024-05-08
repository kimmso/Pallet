import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_getx_palette_diary/src/controller/post_controller.dart';

import 'package:flutter_getx_palette_diary/src/utils/validator_util.dart';

import 'package:flutter_getx_palette_diary/src/view/home_page.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_textfield.dart';

import 'package:get/get.dart';

class UpdatePage extends GetView<PostController> {
  final String? photo_url;
  final String? content;

  const UpdatePage({Key? key, this.photo_url, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('글 수정하기'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => Home());
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
          SizedBox(height: 20),
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
}
