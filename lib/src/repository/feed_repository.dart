import 'package:dio/dio.dart';
import 'package:flutter_getx_palette_diary/src/model/feed.dart';

import 'package:flutter_getx_palette_diary/src/utils/apiurl.dart';
import 'package:get_storage/get_storage.dart';

class FeedRepository {
  final dio = Dio();

  Future<List<Feed>?> feedApi() async {
    try {
      final response = await dio.get(ApiUrls.feedUrl);

      if (response.statusCode == 200) {
        List<Feed> feeds = [];
        for (var data in response.data) {
          final feed = Feed.fromJson(data);
          feeds.add(feed);
        }
        return feeds;
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> putFeeds() async {
    try {
      dio.get(ApiUrls.feedUrl).then((response) {
        if (response.statusCode == 200) {
        } else {
          // exception
        }
        return Feed.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<Feed>?> secondApi() async {
    try {
      String? post_no = GetStorage().read('post_no');

      if (post_no != null) {
        String secondUrl = "${ApiUrls.secondUrl}$post_no";

        final response = await dio.get(secondUrl);

        if (response.statusCode == 200) {
          List<Feed> feeds = [];
          for (var data in response.data) {
            final feed = Feed.fromJson(data);
            feeds.add(feed);
          }
          return feeds;
        }
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> putSeconds() async {
    try {
      dio.get(ApiUrls.feedUrl).then((response) {
        if (response.statusCode == 200) {
        } else {
          // exception
        }
        return Feed.fromJson(response.data);
      });
    } catch (e) {
      throw Exception();
    }
  }
}
