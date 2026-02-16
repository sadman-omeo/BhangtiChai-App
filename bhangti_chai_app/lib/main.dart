import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bhangti Chai App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Bhangti Chai App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  int amount = 0;

  void addNum(int digit) {
    setState(() {
      amount = amount * 10 + digit;
    });
  }

  void clear() {
    setState(() {
      amount = 0;
    });
  }

  Map<int, int> change_calculation(int amount) {
    List<int> notes = [500, 100, 50, 20, 10, 5, 2, 1];

    Map<int, int> change = {}; // its a dictionaryy

    int remaining = amount;

    for (int i in notes) {
      int count = remaining ~/ i; //division sign eta
      change[i] = count; //change namok dict ta update korlam
      remaining = remaining % i;
    }

    return change;
  }


// eta basic format er counter increment ta. keeping for kn knowledge
  // kemne functions banano jabe

  //void _incrementCounter() {
  //setState(() {
  // This call to setState tells the Flutter framework that something has
  // changed in this State, which causes it to rerun the build method below
  // so that the display can reflect the updated values. If we changed
  // _counter without calling setState(), then the build method would not be
  // called again, and so nothing would appear to happen.
  //**_counter++;
  //});
  //}


  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),


      //stateless Widget printed on UI

      //Now time for statefull widgets

      body: SafeArea(
        child: orientation == Orientation.portrait
            ? buildPortraitLayout()
            : buildLandscapeLayout(),
      ),
    );
  }

  Widget buildPortraitLayout() {
    return Column(
      children: [
        SizedBox(height: 30),
        Text(
          "Taka : $amount",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 200),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: buildChangePart()
              ),
              Expanded(
                  child: buildKeypadportrait()
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildLandscapeLayout() {
    return Column(
      children: [
        SizedBox(height: 0),
        Text(
          "Taka : $amount",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: buildChangePart2()
              ),
              Expanded(
                  child: buildKeypadlandscape()
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget buildKeyButton(String text, VoidCallback onPressed) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(3),
        child: AspectRatio(
          aspectRatio: 2,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildKeyButtonland(String text, VoidCallback onPressed) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(6),
        child: AspectRatio(
          aspectRatio: 3,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ),
      ),
    );

  }

  Widget buildKeypadportrait() {
    return Column(
      children: [
        Row(
          children: [
            buildKeyButton("1", () => addNum(1)),
            buildKeyButton("2", () => addNum(2)),
            buildKeyButton("3", () => addNum(3))
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            buildKeyButton("4", () => addNum(4)),
            buildKeyButton("5", () => addNum(5)),
            buildKeyButton("6", () => addNum(6))
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            buildKeyButton("7", () => addNum(7)),
            buildKeyButton("8", () => addNum(8)),
            buildKeyButton("9", () => addNum(9))
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            buildKeyButton("0", () => addNum(0)),
            buildKeyButton("Clear", () => clear())
          ],
        )
      ],
    );
  }


  Widget buildKeypadlandscape() {
    return Column(
      children: [
        Row(
          children: [
            buildKeyButtonland("1", () => addNum(1)),
            buildKeyButtonland("2", () => addNum(2)),
            buildKeyButtonland("3", () => addNum(3))
          ],
        ),
        Row(
          children: [
            buildKeyButtonland("4", () => addNum(4)),
            buildKeyButtonland("5", () => addNum(5)),
            buildKeyButtonland("6", () => addNum(6))
          ],
        ),
        Row(
          children: [
            buildKeyButtonland("7", () => addNum(7)),
            buildKeyButtonland("8", () => addNum(8)),
            buildKeyButtonland("9", () => addNum(9))
          ],
        ),
        Row(
          children: [
            buildKeyButtonland("0", () => addNum(0)),
            buildKeyButtonland("Clear", () => clear())
          ],
        )
      ],
    );
  }

  Widget buildChangePart() {
    Map<int, int> change = change_calculation(amount);
    List<Widget> rows = [];

    List<int> notes = [500, 100, 50, 20, 10, 5, 2, 1];

    for (int i = 0; i < notes.length; i++) {
      int note = notes[i];
      int count = change[note]!; // ! tihs is the count form the map

      rows.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$note : $count", style: TextStyle(fontSize: 30)),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rows,
      ),
    );
  }


  Widget buildChangePart2() {
    Map<int, int> change = change_calculation(amount);

    List<int> leftNotes = [500, 100, 50, 20];
    List<int> rightNotes = [10, 5, 2, 1];

    List<Widget> leftRows = [];
    List<Widget> rightRows = [];

    // Build left column
    for (int i = 0; i < leftNotes.length; i++) {
      int note = leftNotes[i];
      int count = change[note]!;

      leftRows.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Text(
            "$note : $count",
            style: TextStyle(fontSize: 26),
          ),
        ),
      );
    };


    // Build right column
    for (int i = 0; i < rightNotes.length; i++) {
      int note = rightNotes[i];
      int count = change[note]!;

      rightRows.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Text(
            "$note : $count",
            style: TextStyle(fontSize: 26),
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: leftRows,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rightRows,
          ),
        ],
      ),
    );
  }
}