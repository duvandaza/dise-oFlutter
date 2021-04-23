import 'package:flutter/material.dart';


class BotonGordo extends StatelessWidget {

  final IconData icon;
  final String titulo;
  final Color color1;
  final Color color2;
  final Function onPress;

  const BotonGordo({ 
    this.icon = Icons.circle,
    @required this.titulo,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
    this.onPress
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _BotonGordoBackground(color1: this.color1, color2: this.color2, icon: this.icon, ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox( height: 140, width: 40, ),
              Icon(this.icon, color: Colors.white, size:40),
              SizedBox(width: 20,),
              Expanded(child: Text(this.titulo, style: TextStyle( color: Colors.white, fontSize: 18))),
              Icon(Icons.arrow_forward_ios, color: Colors.white,),
              SizedBox(width: 40,)
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  
  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground({ 
   this.icon,
   this.color1,
   this.color2
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: Icon(this.icon, size: 150, color : Colors.white.withOpacity(0.2)),
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(4,6), blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            this.color1,
            this.color2,
          ]
        )
      ),  
    );
  }
}