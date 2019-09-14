import '../screens/holidays.dart';
import 'package:flutter/material.dart';
import '../screens/todoscreen.dart';
import '../screens/faculty.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function handlingTap) {

    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: handlingTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    double defaultScreenWidth = 400.0;
    double defaultScreenHeight = 810.0;
    ScreenUtil.instance = ScreenUtil(
      width: defaultScreenWidth,
      height: defaultScreenHeight,
      allowFontScaling: true,
    )..init(context);

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.instance.setHeight(130),
            width: double.infinity,
            padding: EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
            alignment: Alignment.centerLeft,
            child: Text(
              "Assist",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: ScreenUtil.instance.setSp(30.0),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil.instance.setHeight(20),
          ),
          buildListTile("Home", Icons.home, (){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile("Quick Notes", Icons.add,(){
            Navigator.of(context).pushNamed(ToDoScreen.routeName);
          }),
          buildListTile("Faculty", Icons.account_circle,(){
            Navigator.of(context).pushNamed(Faculty.routeName);
          }),
          buildListTile("Holidays", Icons.airline_seat_flat,(){
            Navigator.of(context).pushNamed(HolidayList.routeName);
          }),
          SizedBox(
            height: ScreenUtil.instance.setHeight(30),
          ),
          Container(
            child: Text("Built with ❤️ and ☕ by Nikhil Singh"),
          )
        ],
      ),
    );
  }
}