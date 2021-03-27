import 'package:flutter/material.dart';
import 'package:what_to_do/utility/colors.dart';
import 'package:what_to_do/utility/strings.dart';
import 'package:what_to_do/utility/themes.dart';
import 'package:what_to_do/views/folder_items.dart';
//import 'work.dart';
import 'package:provider/provider.dart';

bool isDarkModeOn = true;

class HomePage extends StatefulWidget {
  //final List count;
  //const HomePage({Key key, this.count}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //String workCount = todos.length.toString();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            TLStrings.appName,
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
                'Welcome to MYTODOS, here are your folders',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 14.0,
                ),
              ),

              SizedBox(height: 20.0),
              Flexible(
                child: GridView.count(
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  crossAxisCount: 2,
                  children: <Widget>[
                    FolderItems(
                      location: '/allTask',
                      number: '0',
                      folderName: 'All Task',
                      icon: Icons.folder,
                      bgColor: TLColors.purple,
                    ),
                    FolderItems(
                      location: '/work',
                      number: '0',
                      folderName: 'Work',
                      icon: Icons.work,
                      bgColor: TLColors.blue,
                    ),
                    FolderItems(
                      location: '/home',
                      number: '0',
                      folderName: 'Home',
                      icon: Icons.home,
                      bgColor: TLColors.yellow,
                    ),
                    FolderItems(
                      location: '/event',
                      number: '0',
                      folderName: 'Event',
                      icon: Icons.event,
                      bgColor: TLColors.orange,
                    ),
                    FolderItems(
                      location: '/shopping',
                      number: '0',
                      folderName: 'Shopping',
                      icon: Icons.shopping_cart,
                      bgColor: TLColors.pink,
                    ),
                    FolderItems(
                      location: '/health',
                      number: '0',
                      folderName: 'Health',
                      icon: Icons.healing,
                      bgColor: TLColors.green,
                    ),
                  ],
                ),
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                              isDarkModeOn
                                  ? Icons.nightlight_round
                                  : Icons.wb_sunny,
                              size: 30.0),
                          onPressed: () {
                            AppTheme appTheme =
                                Provider.of<AppTheme>(context, listen: false);
                            appTheme.swapTheme();
                            setState(() {
                              isDarkModeOn = !isDarkModeOn;
                            });
                          }),
                      Text(
                        isDarkModeOn ? 'Dark Mode' : 'Light Mode',
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.restore_from_trash, size: 30.0),
                          onPressed: () {
                            Navigator.pushNamed(context, '/trash');
                          }),
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
        ));
  }
}
