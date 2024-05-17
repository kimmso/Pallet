import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/app.dart';
import 'package:flutter_getx_palette_diary/src/controller/post_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/postlist_controller.dart';
import 'package:flutter_getx_palette_diary/src/model/postlist.dart';
import 'package:flutter_getx_palette_diary/src/repository/post_repository.dart';
import 'package:flutter_getx_palette_diary/src/view/home_page.dart';
import 'package:flutter_getx_palette_diary/src/view/update_page.dart';
import 'package:get/get.dart';

class MyPage extends GetView<PostListController> {
  final DateTime selectedDate;

  const MyPage({super.key, required this.selectedDate});

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
      body: _body(),
    );
  }

  Widget _body() {
    String targetTime =
        "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            future: controller.postlistFetchData(targetTime),
            builder: (context, AsyncSnapshot<List<PostList>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: const Text('데이터를 불러오는 중 오류가 발생했습니다.'),
                );
              } else {
                List<PostList>? postList = snapshot.data;
                if (postList == null || postList.isEmpty) {
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
                        _menuIcon(
                          context,
                          onEdit: () {
                            Get.to(
                              () => UpdatePage(
                                photo_url: postlist.photo_url,
                                content: postlist.content,
                                post_no: postlist.post_no,
                              ),
                              binding: BindingsBuilder(() {
                                Get.put(PostController(
                                    repository: PostRepository()));
                                PostController.to
                                    .initTextField(postlist.content!);
                              }),
                            );
                          },
                          onDelete: () {
                            _confirmDelete(context, postlist.post_no!);
                          },
                        ),
                        // 포스트 이미지 표시
                        SizedBox(
                          height: 400,
                          width: double.infinity,
                          child: Image.network(
                            postlist.photo_url ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // 포스트 내용을 코멘트 쓰는 구간에 표시
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            postlist.content ?? '', // 포스트 내용
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 10),
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

  Widget _menuIcon(BuildContext context,
      {required Function onEdit, required Function onDelete}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PopupMenuButton(
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: const Text('수정하기'),
                onTap: () => Future.microtask(() => onEdit()),
              ),
              PopupMenuItem(
                child: const Text('삭제하기'),
                onTap: () => Future.microtask(() => onDelete()),
              ),
            ];
          },
          icon: const Icon(Icons.more_vert),
          offset: const Offset(0, 50),
        ),
      ],
    );
  }

  void _confirmDelete(BuildContext context, int postNo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('삭제 확인'),
          content: const Text('정말로 삭제하시겠습니까?'),
          actions: <Widget>[
            TextButton(
              child: const Text('아니요'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: const Text('예'),
              onPressed: () {
                Get.back();
                controller.deletefetchData(postNo);
                Get.off(() => App());
              },
            ),
          ],
        );
      },
    );
  }
}
