import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/email_controller.dart';

import 'package:flutter_getx_palette_diary/src/view/get_number.dart';
import 'package:flutter_getx_palette_diary/src/widget/custom_elevatedbutton.dart';
import 'package:get/get.dart';

class FindPasswordPage extends GetView<EmailController> {
  const FindPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('비밀번호 찾기'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '이메일을 입력해주세요.',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '이메일',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이메일을 입력하세요.';
                    }

                    final emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value)) {
                      return '올바른 이메일 형식이 아닙니다.';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  text: "확인",
                  onPressed: controller.validationEmail,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
