import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/postlist_controller.dart';
import 'package:flutter_getx_palette_diary/src/model/postlist.dart';
import 'package:get/get.dart';

class MyPage extends GetView<PostListController> {
  final DateTime selectedDate;

  MyPage({required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${selectedDate.year}년 ${selectedDate.month}월 ${selectedDate.day}일',
        ),
        leading: IconButton(
          onPressed: () {
            Get.back(); // 뒤로 가기 버튼을 누르면 이전 화면으로 이동합니다.
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _body(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    String targetTime =
        "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _menuicon(),
          FutureBuilder(
            future: controller.postlistFetchData(targetTime),
            builder: (context, AsyncSnapshot<List<PostList>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('에러 발생: ${snapshot.error}'),
                );
              } else {
                List<PostList>? postList = snapshot.data;
                if (postList == null) {
                  return const Center(
                    child: Text('데이터 없음'),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: postList.map((postlist) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 포스트 이미지 표시
                        Container(
                          height: 400,
                          width: double.infinity,
                          child: Image.network(
                            postlist.photo_url ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // 포스트 내용을 코멘트 쓰는 구간에 표시
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            postlist.content ?? '', // 포스트 내용
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _menuicon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text('수정하기'),
                onTap: () {
                  // 수정 버튼 클릭 시 수행할 작업
                },
              ),
              PopupMenuItem(
                child: Text('삭제하기'),
                onTap: () {
                  // 삭제 버튼 클릭 시 수행할 작업
                },
              ),
            ];
          },
          icon: Icon(Icons.more_vert),
          offset: Offset(0, 50),
        ),
      ],
    );
  }
}
