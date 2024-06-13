import 'package:flutter/material.dart';
import 'package:flutter_getx_palette_diary/src/controller/detail_controller.dart';
import 'package:flutter_getx_palette_diary/src/model/feeddetail.dart';
import 'package:flutter_getx_palette_diary/src/repository/detail_repository.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  final int post_no;
  const DetailPage({super.key, required this.post_no});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<FeedDetail?> _feeddetailsFuture;
  final DetailController controller =
      Get.put(DetailController(repository: DetailRepository()));
  bool _isLiked = false; // 좋아요 상태를 관리할 변수

  @override
  void initState() {
    super.initState();
    _feeddetailsFuture = controller.detailfetchData(widget.post_no);
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(User) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('사용자 아이디'),
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
                _like(),
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

  Widget _like() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: _isLiked ? Colors.red : null,
            ),
            onPressed: _toggleLike,
          ),
          const Text(
            "좋아요 개수", // 좋아요 개수 표시
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
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
}
