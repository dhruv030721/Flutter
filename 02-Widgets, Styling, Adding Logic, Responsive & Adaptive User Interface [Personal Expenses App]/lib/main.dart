import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import './widgets/chart.dart';
import '../widgets/transction_list.dart';
import '../widgets/new_transaction.dart';
import 'models/transcationModel.dart';

void main() {
  // It is used to set your app in your preferreble mode like portariat and landscape
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

// This is MyApp class
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static Color darkblue = Color.fromRGBO(0, 62, 112, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'SF-Pro',
        textTheme: TextTheme(
          titleSmall: TextStyle(
              fontFamily: 'SF-Pro',
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black),
          titleMedium: TextStyle(
              fontFamily: 'SF-Pro',
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: MyApp.darkblue),
        ),
      ),
      home: MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// This is the MyHome Class
class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final List<Transcation> _transctions = [
    Transcation(id: 't1', title: 'Shoes', amount: 99.99, date: DateTime.now()),
    Transcation(id: 't1', title: 'Shoes', amount: 99.99, date: DateTime.now()),
    Transcation(
        id: 't1',
        title: 'Shoes',
        amount: 500,
        date: DateTime.parse("2023-08-01"))
  ];

  bool _showChart = false;

  List<Transcation> get _recentTransctions {
    return _transctions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransction(String txtitle, double txamount, DateTime chosendate) {
    final newTx = Transcation(
      id: DateTime.now().toString(),
      title: txtitle,
      amount: txamount,
      date: chosendate,
    );

    setState(() {
      _transctions.add(newTx);
    });
  }

  void _startAddNewTransction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransction(_addNewTransction);
      },
    );
  }

  void _deleteTransction(String id) {
    setState(() {
      _transctions.removeWhere((element) => element.id == id);
    });
  }

  List<Widget> buildLandscapeContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget txlistWidget) {
    return [
      Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Show Chart"),
            Switch(
                value: _showChart,
                onChanged: (val) {
                  setState(() {
                    _showChart = val;
                  });
                }),
          ],
        ),
      ),
      _showChart
          ? Container(
              margin: EdgeInsets.only(top: 10),
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top -
                      10) *
                  0.6,
              child: Chart(_recentTransctions))
          : txlistWidget,
    ];
  }

  List<Widget> buildPortraitContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget txlistWidget) {
    return [
      Container(
          margin: EdgeInsets.only(top: 10),
          height: (mediaQuery.size.height -
                  appBar.preferredSize.height -
                  mediaQuery.padding.top -
                  10) *
              0.2,
          child: Chart(_recentTransctions)),
      txlistWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      centerTitle: true,
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(0),
          bottom: Radius.circular(20),
        ),
      ),
      title: Text(
        "Personal Expanses",
        style: TextStyle(fontFamily: 'SF-Pro', letterSpacing: 1),
      ),
      backgroundColor: MyApp.darkblue,
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransction(context),
        )
      ],
    );

    final txlistWidget = Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top -
                10) *
            0.8,
        child: Transction_List(_transctions, _deleteTransction));

    return Scaffold(
        appBar: appBar,
        body: Column(
          children: [
            if (isLandscape)
              ...buildLandscapeContent(
                mediaQuery,
                appBar,
                txlistWidget,
              ),
            if (!isLandscape)
              ...buildPortraitContent(
                mediaQuery,
                appBar,
                txlistWidget,
              ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTransction(context),
          child: Icon(Icons.add),
          backgroundColor: MyApp.darkblue,
        ));
  }
}
