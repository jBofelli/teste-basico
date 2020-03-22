import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,

        fontFamily: "Engcomica"
      ),
      home: MyHomePage(title: 'Aplicação Meia Boca'),


    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  //final GlobalKey<scaffoldState> _sKey = new GlobalKey<scaffoldState>();

  /*void method1(){
    _sKey.currentState.showSnackBar(new SnackBar(content: new Text("Activated SnackBar!")));
  }*/

   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();





  //}
  final snack = SnackBar(
    content: Text("Você clicou no item 1!"),
    duration: Duration(seconds: 3),
    backgroundColor: Colors.green,
    action: new SnackBarAction(label: "Ok", onPressed: (){
      print('press OK on SnackBar');
    }),
  );



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        key: _scaffoldKey,
        //Scaffold.of(context).showSnackBar(snack);
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      //Key: _sKey,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        //child: new RaisedButton(
         //   onPressed: (){method1();},
          //  )
        //child: new Text("Activated SnackBar!"),
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contador:',
              style: TextStyle(fontSize: 30.0),
            ),
            Text(
              '$_counter',
              //'teste',
              style: Theme.of(context).textTheme.display1,
            ),
            FlightBookButton() //2727
          ],
        ),
      ),
      backgroundColor: Colors.blue,
      bottomSheet: BottomAppBar(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
                //askedToLead;
                //createSnackBar("Você clicou no item 1");

                //Scaffold.of(context).showSnackBar(snack);
                _scaffoldKey.currentState.showSnackBar(snack);
                //print("item 1-teste");
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
                //Navigator.pop(context);
                //askedToLead;
                //createSnackBar("Você clicou no item 2");

                //Scaffold.of(context).showSnackBar(snack);


              },
            ),
          ],
        ),
      ),

      persistentFooterButtons: <Widget>[ Icon(Icons.ac_unit),Icon(Icons.airline_seat_recline_normal), ],
      /*floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        onPressed: _incrementCounter,
        tooltip: 'Diminuir',
        child: Icon(Icons.do_not_disturb_on),*/
      floatingActionButton: _crearBotones(),
      //),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _crearBotones(){

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30.0),
        FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed: (){_xcounter(3);}),
        Expanded(child: SizedBox()),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: (){_xcounter(2);}),
        SizedBox(width: 5.0),
        FloatingActionButton(child: Icon(Icons.add), onPressed: (){_xcounter(1);})
      ],
    );







  }

void _xcounter(int str) {

  //int _counter = 0;
    switch(str) {
    case 1:
      {
        setState(() {

          _counter= _counter + 1;
        });
      }
      break;

    case 2:
      {
        setState(() {

          _counter= _counter - 1;
        });

      }
      break;
    case 3:
      {
        setState(() {

          _counter= 0;
        });

      }
      break;
  }
}


}


class FlightBookButton extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: 250.0,
      height: 50.0,
      child: RaisedButton(
        color: Colors.deepOrange,
        child: Text("Book Your Flight!",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      //fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700
                    ),),
        elevation: 6.0,
        /*onPressed: (){
          bookFlight(context);

        }*/
        onPressed: () => bookFlight(context)
        ),

    );
  }
  void bookFlight(BuildContext context){
    var alertDialog = AlertDialog(
      title: Text("Flight Booked Successfully!"),
      content: Text("Have a pleasant flight!"),
    );
    showDialog(
        context: context,
        /*builder: (BuildContext context){
          return alertDialog;
        }*/
        builder: (BuildContext context) => alertDialog
    );
  }
}