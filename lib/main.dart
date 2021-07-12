import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Text(
                  'Seu saldo é de R\$${300.0}',
                  semanticsLabel: 'Seu saldo é de ${300} reais',
                ),
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Mastercard_2019_logo.svg/1280px-Mastercard_2019_logo.svg.png',
                  semanticLabel: 'mastercard',
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.thumb_up),
                  tooltip: 'curtir',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Semantics(
                        child: Icon(Icons.volume_up),
                        label: 'aumentar o volume',
                        sortKey: OrdinalSortKey(1.0),
                      ),
                      ExcludeSemantics(child: Text('VOL')),
                      Semantics(
                        child: Icon(Icons.volume_down),
                        label: 'diminuir o volume',
                        sortKey: OrdinalSortKey(2.0),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Flexible(
                  child: Column(
                    children: [
                      Semantics(
                        child: Icon(Icons.brightness_high),
                        label: 'aumentar o bilho',
                        sortKey: OrdinalSortKey(3.0),
                      ),
                      ExcludeSemantics(child: Text('BRILHO')),
                      Semantics(
                        child: Icon(Icons.brightness_low),
                        label: 'diminuir o bilho',
                        sortKey: OrdinalSortKey(4.0),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
