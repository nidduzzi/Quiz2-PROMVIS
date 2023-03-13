import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: const FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: const Text('Quiz Flutter'),
            actions: const <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: const Center(
          child: App(),
        ),
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  AppState createState() {
    return AppState();
  }
}

enum TravelMethod { car, walk, bike }

class TravelRecord {
  TravelMethod method;
  double distance;
  Duration duration;
  DateTime date;
  TravelRecord(this.method, this.distance, this.duration, this.date);
}

String parseDateTime(DateTime date) {
  return "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
}

String parseDuration(Duration duration) {
  return "${duration.inHours.toString()}";
}

class AppState extends State<App> {
  List<TravelRecord> data = [];
  String durationSelected = "1 Januari 2023";
  String dateOut = "1 Januari 2023";

  @override
  void initState() {
    super.initState();
    // isi data listview
    data.add(TravelRecord(TravelMethod.car, 10,
        Duration(hours: 20, minutes: 30), DateTime(2023, 1, 1)));
    data.add(TravelRecord(TravelMethod.walk, 20,
        Duration(hours: 40, minutes: 20), DateTime(2023, 1, 1)));
  }

  @override
  Widget build(BuildContext context) {
    List<String> listTanggal = [];
    listTanggal.add("1 Januari 2023");
    listTanggal.add("2 Januari 2023");
    void prevDate() => {
          // setState(() {
          //   dateSelected = dateSelected.subtract(const Duration(days: 1));
          // })
        };
    void nextDate() => {
          // setState(() {
          //   dateSelected = dateSelected.add(const Duration(days: 1));
          // })
        };
    // setState(() {
    //   dateSelected = listTanggal[0];
    // });

    return Center(
      child: Column(
        children: [
          // child: Column(children: [Container(child: Row(),),Container(child: Row(),)]),
          Container(
              child: Center(
                  child: Column(children: [
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: prevDate, child: const Text("<"))),
                  Expanded(
                      child: DropdownButton(
                    value: dateSelected,
                    items: listTanggal
                        .map<DropdownMenuItem<String>>(
                            (e) => (DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                )))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        if (newValue != null) {
                          dateSelected = newValue;
                          dateOut = newValue;
                        }
                      });
                    },
                  )),
                  Expanded(
                      child: TextButton(
                          onPressed: nextDate, child: const Text(">")))
                ],
              ),
            ),
            Text(dateOut,
                style: const TextStyle(color: Colors.red, fontSize: 20)),
          ]))),
          Container(),
          Center(
            child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(20),
                children: [
                  Container(
                      decoration: BoxDecoration(border: Border.all()),
                      padding: EdgeInsets.all(14),
                      child: ListTile(
                          onTap: () {},
                          leading: Image.network(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                          trailing: const Icon(Icons.more_vert),
                          title: const Text('Judul'),
                          subtitle: const Text("ini Subjudul"),
                          tileColor: Colors.white70)),
                  Container(
                      decoration: BoxDecoration(border: Border.all()),
                      padding: EdgeInsets.all(14),
                      child: ListTile(
                          onTap: () {},
                          leading: Image.network(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                          trailing: const Icon(Icons.more_vert),
                          title: const Text('Judul'),
                          subtitle: const Text("ini Subjudul"),
                          tileColor: Colors.white70)),
                ]),
          ),
        ],
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Nama Kelompok'),
            content: const Text(
                'Ahmad Izzuddin ahmadizzuddin@upi.edu ; Thariq Hafizuddin thariqhafizhuddin@upi.edu'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
