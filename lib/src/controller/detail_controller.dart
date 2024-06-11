import 'package:flutter_getx_palette_diary/src/model/feeddetail.dart';
import 'package:flutter_getx_palette_diary/src/repository/detail_repository.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final Rxn<FeedDetail> _feeddetails = Rxn<FeedDetail>();

  final DetailRepository repository;
  DetailController({
    required this.repository,
  });

  Future<FeedDetail?> detailfetchData(int post_no) async {
    final feeddetail = await repository.detailApi(post_no);
    if (feeddetail != null) {
      print(2222);
      _feeddetails.value = feeddetail;
      print(1111);
      return feeddetail;
    } else {
      print(333);
    }
  }
}
