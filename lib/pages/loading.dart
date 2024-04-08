import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:world_time_app/network/network.dart';
import 'package:world_time_app/pojo/TimeData.dart';
import 'package:world_time_app/pojo/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final loadingIndicator = const SpinKitFadingCube(
    color: Colors.white,
    size: 80.0,
  );

  @override
  void initState() {
    super.initState();

    getInitialDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: loadingIndicator,
    );
  }

  void getInitialDetails() async {
    Network network = Network();
    TimeData data = await network.getCurrentTimeDetails('Asia/Kolkata');

    // Get properties from Data
    String dateTime = data.datetime!;
    String offset = data.utcOffset!;

    List<String> offsetDetails = offset.split(':');
    int offsetHour = int.parse(offsetDetails[0]);
    int offsetMinutes = int.parse(offsetDetails[1]);

    DateTime now = DateTime.parse(dateTime)
        .add(Duration(hours: offsetHour, minutes: offsetMinutes));

    bool isDayTime = (now.hour >= 6 && now.hour < 18) ? true : false;

    String currentTime = DateFormat.jm().format(now);

    WorldTime worldTime = WorldTime.data(
        time: currentTime,
        isDayTime: isDayTime,
        location: 'New Delhi',
        flag: 'india.png');

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'data': worldTime,
    });
  }
}
