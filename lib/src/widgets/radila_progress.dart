import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSegundario;
  final double grosorSegundario;
  final double grosorPrimario;

  RadialProgress({
    @required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorSegundario = Colors.grey,
    this.grosorSegundario = 4,
    this.grosorPrimario = 10
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {

  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {

    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(vsync: this, duration: Duration( milliseconds : 200 ));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    controller.forward( from: 0.0 );

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child){
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress( 
              (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value), 
              widget.colorPrimario, widget.colorSegundario, widget.grosorSegundario, widget.grosorPrimario
            )
          ),
        );
      },
    );

    
  }
}


class _MiRadialProgress extends CustomPainter {

  final porcentaje;
  final Color colorPrimario;
  final Color colorSegundario;
  final double grosorSegundario;
  final double grosorPrimario;

  _MiRadialProgress( 
    this.porcentaje,
    this.colorPrimario,
    this.colorSegundario,
    this.grosorSegundario,
    this.grosorPrimario
  );

  @override
  void paint(Canvas canvas, Size size) {

      
      // Circulo completo
      final paint = new Paint()
        ..strokeWidth = grosorSegundario
        ..color       = colorSegundario
        ..style       = PaintingStyle.stroke;

        final center = new Offset( size.width * 0.5 , size.height / 2 );
        final radio = min( size.width * 0.5, size.height * 0.5 );

        canvas.drawCircle(center, radio, paint);

        // Arco
        final paintArco = new Paint()
        ..strokeWidth = grosorPrimario
        ..color       = colorPrimario
        ..strokeCap   = StrokeCap.round
        ..style       = PaintingStyle.stroke;

        // Parte que se debera ir llenando
        double arcAngle = 2 * pi * (porcentaje / 100);
        canvas.drawArc(
          Rect.fromCircle( center: center, radius: radio ),
          -pi / 2, 
          arcAngle, 
          false, 
          paintArco
        );
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}