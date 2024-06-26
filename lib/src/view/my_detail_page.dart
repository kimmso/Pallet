import 'package:flutter/material.dart';

import 'package:flutter_getx_palette_diary/src/controller/detail_controller.dart';
import 'package:flutter_getx_palette_diary/src/controller/like_controller.dart';
import 'package:flutter_getx_palette_diary/src/model/feeddetail.dart';
import 'package:flutter_getx_palette_diary/src/repository/detail_repository.dart';
import 'package:flutter_getx_palette_diary/src/repository/like_repository.dart';
import 'package:get/get.dart';

class MydetailPage extends StatefulWidget {
  final int post_no;
  const MydetailPage({Key? key, required this.post_no}) : super(key: key);

  @override
  _MyDetailPageState createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MydetailPage> {
  late Future<FeedDetail?> _feeddetailsFuture;
  final DetailController detailController =
      Get.put(DetailController(repository: DetailRepository()));
  final LikeController likeController =
      Get.put(LikeController(repository: LikeRepository()));

  @override
  void initState() {
    super.initState();
    _feeddetailsFuture = detailController.detailfetchData(widget.post_no);
    likeController.pluslikefetchData(widget.post_no);
  }

  void _toggleLike() async {
    if (likeController.isLiked.value) {
      await likeController.minuslikefetchData(widget.post_no);
    } else {
      await likeController.pluslikefetchData(widget.post_no);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FutureBuilder<FeedDetail?>(
          future: _feeddetailsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading...');
            } else if (snapshot.hasError) {
              return Text('Error');
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Text('No data found');
            } else {
              return _username(snapshot.data!.name);
            }
          },
        ),
      ),
      body: FutureBuilder<FeedDetail?>(
        future: _feeddetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data found'));
          } else {
            return _body(snapshot.data!);
          }
        },
      ),
    );
  }

  Widget _body(FeedDetail feedDetail) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                _likeCount(),
              ],
            ),
            _image(feedDetail.photo_url),
            _date(feedDetail.create_date),
            const SizedBox(height: 20),
            _content(feedDetail.content),
          ],
        ),
      ),
    );
  }

  Widget _image(String? photoUrl) {
    return Container(
      color: Colors.grey,
      height: 400,
      width: double.infinity,
      child: photoUrl != null
          ? Image.network(photoUrl, fit: BoxFit.cover)
          : Text('No Image'),
    );
  }

  Widget _content(String? content) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: content != null
              ? Text(
                  content,
                  style: const TextStyle(fontSize: 16),
                )
              : Text('No Content'),
        ),
      ),
    );
  }

  Widget _likeCount() {
    return Obx(() {
      int like_count =
          likeController.like_count.value; // likeCount 변수를 사용하여 좋아요 개수를 가져옵니다.
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Text(
            '$like_count', // 좋아요 개수 표시
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
    });
  }

  Widget _date(String? createDate) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          createDate != null ? '$createDate' : '날짜 정보 없음',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _username(String? name) {
    return Text(
      '$name 님의 게시글',
      style: const TextStyle(fontSize: 20.0),
    );
  }
}
