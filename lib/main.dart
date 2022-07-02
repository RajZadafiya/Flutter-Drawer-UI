import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'first_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.green[10]:null,
      ),
      // routes: <String,WidgetBuilder>{
      //   "/a" : (BuildContext context)=> new FirstPage("First Page"),
      // },
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  int current_step = 0;

  List<Step> mysteps = [
    new Step(title: new Text("Step 1"), content: new Text("Content of step 1"),isActive: true),
    new Step(title: new Text("Step 2"), content: new Text("Content of step 2"),isActive: true),
    new Step(title: new Text("Step 3"), content: new Text("Content of step 3"),isActive: true),
    new Step(title: new Text("Step 4"), content: new Text("Content of step 4"),isActive: true),
    new Step(title: new Text("Step 5"), content: new Text("Content of step 5"),isActive: true),
    new Step(title: new Text("Step 6"), content: new Text("Content of step 6"),isActive: true),
  ];

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        bottom: new TabBar(
            controller: controller,
            tabs: [
              new Tab(
                icon: new Icon(Icons.account_balance_rounded),
                text: "My Bank",
              ),
              new Tab(
                  icon: new Icon(Icons.account_circle_outlined),
                  text: "User Profile"
              ),
              new Tab(
                icon: new Icon(Icons.add_a_photo_rounded),
                text: "Camera",
              ),
              new Tab(
                icon: new Icon(Icons.add_alarm),
                text: "Alarm",
              )
            ],
          ),
        title: new Text("Drawer & Routing App"),
        elevation: defaultTargetPlatform == TargetPlatform.android? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: new Text("RZ"), accountEmail: new Text("your@gmail.com")
            ,currentAccountPicture: new CircleAvatar(
                backgroundColor: Theme.of(context).platform == TargetPlatform.iOS?Colors.deepPurple:Colors.white,
                child: new Text("RZ"),
              ),
              otherAccountsPictures: [
                new CircleAvatar(
                  backgroundColor: Colors.black,
                  child: new Text("Z"),
                )
              ],
            ),
            new ListTile(
              title: new Text("Page 1"),
              trailing: new Icon(Icons.ac_unit),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new FirstPage("FirstPage")));
                // Navigator.of(context).pushNamed("/a");
                },
            ),
            new ListTile(
              title: new Text("Page 2"),
              onTap: () {
                Navigator.of(context).pop();
                // Navigator.of(context).pushNamed("/a");
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new FirstPage("SecondPage")));
              },
              trailing: new Icon(Icons.access_alarms_rounded),
            ),
            new ListTile(
              title: new Text("Page 3"),
              trailing: new Icon(Icons.accessibility_outlined),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new FirstPage("ThirdPage")));
                // Navigator.of(context).pushNamed("/a");
              },
            ),
            new ListTile(
              title: new Text("Page 4"),
              trailing: new Icon(Icons.account_box),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new FirstPage("FourthPage")));
                // Navigator.of(context).pushNamed("/a");
              },
            ),
            new Divider(
              color: Colors.green,
              height: 1.0,
              thickness: 1.0,
            ),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),

              onTap: ()=> Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: new TabBarView(
        children: <Widget>[
          new TabPages("First Tab"),
          new TabPages("Second Tab"),
          new TabPages("Third Tab"),
          new TabPages("Fourth Tab"),
        ],
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.lightGreen,
        elevation: 5.0,
        textStyle: new TextStyle(fontSize: 10.0,color: Colors.blue),
        child: new TabBar(
          controller: controller,
          tabs: [
            new Tab(
              icon: new Icon(Icons.account_circle),
              text: "Users",
            ),
            new Tab(
              icon: new Icon(Icons.accessibility_outlined),
              text: "Access"
            ),
            new Tab(
              icon: new Icon(Icons.access_alarm),
              text: "Alarm",
            ),
            new Tab(
              icon: new Icon(Icons.ac_unit_outlined),
              text: "Outline",
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        backgroundColor: Colors.lime,
        onPressed: ()=>new TabPages("Clicked Floating Action"),
        hoverColor: Colors.blue,
      ),
      // new Container(
      //   child: new Stepper(
      //     steps: mysteps,
      //     currentStep: this.current_step,
      //     type: StepperType.vertical,
      //     elevation: 4.0,
      //   ),
      // ),
    );
  }
}

class TabPages extends StatelessWidget {

  String title = "";

  TabPages(this.title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new MyBody(),
      ),
    );
  }
}


class MyBody extends StatelessWidget {

  AlertDialog dialog = new AlertDialog(
    content: new Text("Alert Dialog...",style : new TextStyle(fontSize: 30.0)),
    title: new Text("My Dialog"),
    backgroundColor: Colors.grey,
    elevation: 2.0,
    titleTextStyle: new TextStyle(color: Colors.blueGrey,fontSize: 40.0,),
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      child:new Center(
        child : new RaisedButton(
          child:new Text("Submit",style: new TextStyle(color: Colors.white),),
          color: Colors.teal,
          onPressed: ()=>Scaffold.of(context).showSnackBar(
              new SnackBar(
                content:new Text("I am clicked..."),
                duration: new Duration(seconds: 3),
              )
          )
          // onPressed: ()=> showDialog(context: context,builder: (BuildContext context) =>dialog ),
    ),
      )
    );
  }
}


