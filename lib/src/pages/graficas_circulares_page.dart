import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:diseno/src/widgets/radila_progress.dart';
import 'package:diseno/src/theme/theme.dart';

class GraficasCircularesPage extends StatefulWidget {

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.refresh ),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100){
              porcentaje = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue, grosorP: 10, grosorS: 4),
              CustomRadialProgress(porcentaje: porcentaje * 1.2, color: Colors.orange[800], grosorP: 8, grosorS: 10),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje * 1.4, color: Colors.green, grosorP: 16, grosorS: 6),
              CustomRadialProgress(porcentaje: porcentaje * 1.6, color: Colors.red, grosorP: 8, grosorS: 14),
            ],
          ),
        ],


      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color color;
  final double grosorP;
  final double grosorS;

  const CustomRadialProgress({
    @required this.porcentaje,
    @required this.color,
    this.grosorP = 10,
    this.grosorS = 4,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      width: 140,
      height: 140,
      // color: Colors.red
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSegundario: appTheme.textTheme.bodyText2.color,
        grosorPrimario: grosorP,
        grosorSegundario: grosorS,
      ),
    );
  }
}