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
      _feeddetails.value = feeddetail;

      return feeddetail;
    } else {
      print(222);
    }
  }
}
