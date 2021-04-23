import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:diseno/src/theme/theme.dart';
import 'package:flutter_svg/svg.dart';

import 'package:diseno/src/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple[500],
      body: Column(
        children: [
          Expanded(child: MiSlideshow()),
          Expanded(child: MiSlideshow())
        ],
      ),      
    );
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Slideshow(
      bulletPrimario:16,
      bulletSegundario:12,
      puntosArriba:false,
      colorPrimario: ( appTheme.darkTheme ) ? accentColor : Colors.orange[800],
      colorSegundario: Colors.grey[400],
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
        
      ],
    );
  }
}