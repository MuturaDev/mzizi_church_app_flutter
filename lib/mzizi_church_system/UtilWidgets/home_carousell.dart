import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousell extends StatefulWidget {
  @override
  _HomeCarousellState createState() => _HomeCarousellState();
}

class _HomeCarousellState extends State<HomeCarousell> {
  final List<String> imgList = [
    // 'https://imagizer.imageshack.com/img922/1959/IaIQx8.jpg',
    // 'https://imagizer.imageshack.com/img924/7272/YYCa8d.jpg',
    // 'https://imagizer.imageshack.com/img924/3559/QWs8fu.jpg',
    // 'https://imagizer.imageshack.com/img923/268/u1cHRX.jpg',
    // 'https://imagizer.imageshack.com/img924/7841/QwipFB.jpg',
    // 'https://imagizer.imageshack.com/img923/1769/wTyQhO.jpg'

    //  'https://imagizer.imageshack.com/img923/6161/2TUveM.jpg',
    //   'https://imagizer.imageshack.com/img924/120/c0yebZ.jpg',
    //   'https://imagizer.imageshack.com/img924/4274/LXwd4y.jpg',

    'https://imagizer.imageshack.com/img924/1260/o8aVXk.jpg',

    'http://www.jccmombasa.org/images/2018.jpg',
    'http://www.jccmombasa.org/images/church.jpg',
    'http://www.jccmombasa.org/images/e.jpg',
    'http://www.jccmombasa.org/images/f.jpg',
    'http://www.jccmombasa.org/images/c.jpg'
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(0.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          item,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 2 - 170,
                          // loadingBuilder: (context, child, progress) {
                          //   return progress == null
                          //       ? child
                          //       : LinearProgressIndicator(backgroundColor: Colors.black,);
                          // },
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              //'No. ${imgList.indexOf(item)} image',
                              '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Container(
      child: Container(
        child: Stack(children: [
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 2 - 170,
                viewportFraction: 1.0,
                autoPlay: true,
                autoPlayInterval: Duration(milliseconds: 10000),
                enlargeCenterPage: false,
                // aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 200,
            right: 0.0,
            left: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.map((url) {
                int index = imgList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.white : Color(0xFF487890),
                  ),
                );
              }).toList(),
            ),
          ),
        ]),
      ),
    );
  }
}
