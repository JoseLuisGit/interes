import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:intereses/view/interes.dart';

class Presentacion extends StatelessWidget {
  const Presentacion({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController(
      initialPage: 0,
    );

    @override
    void dispose() {
      _pageController.dispose();
    }

    return Scaffold(
      body: PageView(
        controller: _pageController,
        pageSnapping: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _components(
              context, 'assets/images/p1.png', "Bienvenido", "", Colors.blue),
          _components(context, 'assets/images/p2.png', "Torneos",
              "Consigue todo xd", Colors.teal),
          _components(context, 'assets/images/p3.png', "Comparte",
              "Sigue los torneos de tu interes", Colors.deepPurpleAccent),
          InteresPage(),
        ],
      ),
      floatingActionButton: SmoothPageIndicator(
        controller: _pageController,
        count: 4,
        effect:
            WormEffect(dotColor: Colors.black54, activeDotColor: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  _components(BuildContext context, String imagen, String titulo,
      String subtitulo, Color color) {
    final estiloTitulo = TextStyle(
        color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
    final estiloSubtitulo = TextStyle(color: Colors.black, fontSize: 20);

    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width / 2;
    var height = screenSize.height / 2;
    return Container(
      color: color,
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image(
                image: AssetImage(imagen),
                width: width,
                height: height,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              titulo,
              style: estiloTitulo,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              subtitulo,
              style: estiloSubtitulo,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12.0,
            ),
            Expanded(child: Container()),
          ],
        ),
      )),
    );
  }
}
