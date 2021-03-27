import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FolderItems extends StatelessWidget {
  final String location;
  final String folderName;
  final Color bgColor;
  final IconData icon;
  final String number;

  const FolderItems(
      {Key key,
      this.location,
      this.folderName,
      this.bgColor,
      this.icon,
      this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, location);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(folderName,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
//                        fontWeight: FontWeight.bold
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  number,
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        //height: 140.0,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              spreadRadius: 0.9,
              blurRadius: 5.0,
              offset: Offset(5, 5), // changes position of shadow
            ),
          ],
          color: bgColor,
        ),
      ),
    );
  }
}
