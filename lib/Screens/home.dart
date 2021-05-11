import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:natur/Services/auth.dart';
import 'package:natur/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffffff),
        shadowColor: Color(0xffffff),
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/icons/menu.png',
              height: 24,
            ),
            Spacer(),
            Image.asset(
              'assets/icons/logo.png',
              height: 35,
            ),
            Spacer(),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFF9EFE5), width: 2),
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70'))),
            ),
          ],
        ),
      ),
      // backgroundColor: Color(0xffffffff),
      body: DefaultTabController(
        length: 3,
        child: Container(
          color: Color(0x59F7F1EA),
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 5, 24, 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for products',
                    hintStyle: TextStyle(
                      color: Color(0xffE1A067),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    // contentPadding: EdgeInsets.symmetric(horizontal: ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 12, 0),
                      child: Image.asset(
                        'assets/icons/search.png',
                        height: 20,
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(maxHeight: 16),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 5, 0),
                      child: Image.asset(
                        'assets/icons/mic on.png',
                        height: 16,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide:
                          BorderSide(color: Color(0xffF7F1EA), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide:
                          BorderSide(color: Color(0xffF7F1dA), width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide(color: Colors.grey[400], width: 2),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, width / 2.8, 0),
                    child: PreferredSize(
                      preferredSize: Size.fromHeight(kToolbarHeight),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                          indicator: CircleTabIndicator(
                              color: Color(0xff633820), radius: 2),
                          indicatorWeight: 4,
                          indicatorPadding: EdgeInsets.fromLTRB(2, 0, 20, 0),
                          isScrollable: true,
                          labelColor: Color(0xff633820),
                          unselectedLabelColor: Color(0x80633820),
                          labelStyle: labelS,
                          unselectedLabelStyle: unSelectedLabelS,
                          labelPadding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                          tabs: [
                            Tab(text: 'New'),
                            Tab(text: 'Popular'),
                            Tab(text: 'Sale'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(23, 5, 0, 5),
                    child: SizedBox(
                      height: 1,
                      width: 1.4 * width / 2.8,
                      child: Container(
                        height: 2,
                        // color: Colors.red,
                        color: Color.fromRGBO(0, 0, 0, .01),
                      ),
                    ),
                  ),
                  Container(
                    height: 244,
                    child: TabBarView(children: [
                      Container(color: Colors.blue),
                      Container(color: Colors.yellow),
                      Container(color: Colors.green),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
