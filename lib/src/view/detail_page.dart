import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(),
    );
  }
}

Widget _body() {
  return SingleChildScrollView(
    child: Center(
        child: Column(
      children: [
        _image(),
        SizedBox(
          height: 20,
        ),
        _content(),
      ],
    )),
  );
}

Widget _image() {
  return Container(
    color: Colors.grey,
    height: 400,
    width: 350,
  );
}

Widget _content() {
  return Container(
    color: Colors.grey,
    height: 100,
    width: 350,
  );
}
