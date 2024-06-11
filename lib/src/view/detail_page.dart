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

  @override
  void initState() {
    super.initState();
    _feeddetailsFuture = controller.detailfetchData(widget.post_no);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            _image(feedDetail.photo_url),
            const SizedBox(height: 20),
            _content(feedDetail.content),
          ],
        ),
      ),
    );
  }

  Widget _image(String? photo_Url) {
    return Container(
      color: Colors.grey,
      height: 400,
      width: 350,
      child: photo_Url != null
          ? Image.network(photo_Url, fit: BoxFit.cover)
          : Center(child: Text('No Image')),
    );
  }

  Widget _content(String? content) {
    return Container(
      color: Colors.grey,
      height: 100,
      width: 350,
      child:
          content != null ? Text(content) : Center(child: Text('No Content')),
    );
  }
}
