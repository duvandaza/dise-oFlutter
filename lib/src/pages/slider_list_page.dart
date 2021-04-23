import 'package:flutter/material.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _Titulo(),
      // body: _ListaTareas(),
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BotonNewList()
          )
        ],
      ),
   );
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: size.height * 0.15,
      child: RaisedButton(
        onPressed: (){},
        color: Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only( topLeft: Radius.circular(50) )
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3
          ),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {

  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(  
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minheight: 160,
            maxheight: 170,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: _Titulo(),
            )
          ),
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 80),
          ])
        )

      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate  {

  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({ 
    @required this.minheight, 
    @required this.maxheight,  
    @required this.child 
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
      // TODO: implement build
      return SizedBox.expand(child: child);
    }
  
    @override
    double get maxExtent => maxheight;
  
    @override
    double get minExtent => minheight;
  
    @override
    bool shouldRebuild( _SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
           minheight != oldDelegate.minheight ||
           child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 25,), 
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text('NEW', style: TextStyle(color: Color(0xff532128), fontSize: 40),),
        ),
        Stack(
          children: <Widget>[
            SizedBox(width: 80,),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color: Color(0xffF7CDD5)
              ),
            ),
            Container(
              child: Text('List', style: TextStyle(color: Color(0xffD93A39), fontSize: 40, fontWeight: FontWeight.bold,)),
            )
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {

  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index] );
  }         
}

class _ListItem extends StatelessWidget {
  
  final String titulo;
  final Color color;

  const _ListItem( this.titulo, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text( titulo, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25), ),
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}