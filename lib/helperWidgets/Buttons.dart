import 'package:flutter/material.dart';
class Buttons extends StatelessWidget {
  final Function function ;
  final String name ;
  final double width ;
  const Buttons({Key key, this.function,this.name,this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16), //spacing b/w
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff023750),
              Colors.blue
            ],
          ),borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bahij',
                  color: Colors.white,
                  fontSize: 18),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
Widget drawerButton(TextStyle style1,String name,Widget widget,{Widget widget2}){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
            name,
            style: style1),
        widget2,
        widget,
      ],
    ),
  );
}

class ProfileIcons extends StatelessWidget {
  final Function function ;
  final String url ;
  const ProfileIcons({Key key, this.function,this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function ,
      child: ClipRRect(
        child: Image.asset(
          url,
          fit: BoxFit.fill,
          height: 50,
          width: 50,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}