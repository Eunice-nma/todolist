import 'package:flutter/material.dart';
import 'package:what_to_do/utility/themes.dart';
import 'work.dart';
import 'package:provider/provider.dart';


bool isDarkModeOn= true;


class HomePage extends StatefulWidget {
  //final List count;
  //const HomePage({Key key, this.count}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  @override

  Widget build(BuildContext context) {
    String workCount= todos.length.toString();

    Widget folders(bgColor, folderName, img, location, number){
      return GestureDetector(
        onTap: (){
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
                  child: Text(
                      folderName,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    img,
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
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
          ),
          height: 143.0,

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'MYTODOS',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Good Morning,',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 3.0),
            Text(
              'Welcome to MYTODO\'S, here are your folders',
              style: TextStyle(color: Colors.grey[500], fontSize: 14.0, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10.0),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: folders(Color(0xFF6c56da), 'All Task', Icons.folder, '/allTask', '0')),
                SizedBox(width: 15.0),
                Expanded(child: folders(Color(0xFF005ef5), 'Work', Icons.work, '/work', workCount)),
              ],
            ),

            SizedBox(height: 15.0),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: folders(Color(0xFFf6bc38), 'Home', Icons.home, '/home', '0')),
                SizedBox(width: 15.0),
                Expanded(child: folders(Color(0xFFf78c3f), 'Events', Icons.event, '/events', '0')),
              ],
            ),

            SizedBox(height: 15.0),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(child: folders(Color(0xFFf74f56), 'Shopping', Icons.shopping_cart, '/shopping', '0')),
                SizedBox(width: 15.0),
                Expanded(child: folders(Color(0xFF2ec98b), 'Health', Icons.healing, '/health', '0')),
              ],
            ),

            SizedBox(height: 10.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Column(
                  children: <Widget>[
                  IconButton(
                      icon: Icon(
                          isDarkModeOn? Icons.nightlight_round: Icons.wb_sunny,
                          size: 30.0),
                          onPressed: (){
                            AppTheme appTheme = Provider.of<AppTheme>(context, listen: false);
                            appTheme.swapTheme();
                            setState(() {
                              isDarkModeOn= !isDarkModeOn;
                            });
                          }
                      ),
                  Text(
                    isDarkModeOn? 'Dark Mode':'Light Mode',
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                  ],
                ),
                Column( children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.restore_from_trash, size: 30.0),
                      onPressed: (){
                        Navigator.pushNamed(context, '/trash');
                      }
                    ),
                  Text(
                    'Recycle Bin',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
                ),
              ],
            ),


          ],
        ),
      )
    );
  }
}
