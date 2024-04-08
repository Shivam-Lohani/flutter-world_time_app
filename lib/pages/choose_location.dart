import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:world_time_app/network/network.dart';
import 'package:world_time_app/pojo/TimeData.dart';
import 'package:world_time_app/pojo/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime.listData(
        location: 'New Delhi', flag: 'india.png', endpoint: 'Asia/Kolkata'),
    WorldTime.listData(
        location: 'London', flag: 'uk.png', endpoint: 'Europe/London'),
    WorldTime.listData(
        location: 'Berlin', flag: 'germany.png', endpoint: 'Europe/Berlin'),
    WorldTime.listData(
        location: 'Athens', flag: 'greece.png', endpoint: 'Europe/Berlin'),
    WorldTime.listData(
        location: 'Cairo', flag: 'egypt.png', endpoint: 'Africa/Cairo'),
    WorldTime.listData(
        location: 'Nairobi', flag: 'kenya.png', endpoint: 'Africa/Nairobi'),
    WorldTime.listData(
        location: 'Chicago', flag: 'usa.png', endpoint: 'America/Chicago'),
    WorldTime.listData(
        location: 'New York', flag: 'usa.png', endpoint: 'America/New_York'),
    WorldTime.listData(
        location: 'Seoul', flag: 'south_korea.png', endpoint: 'Asia/Seoul'),
    WorldTime.listData(
        location: 'Jakarta', flag: 'indonesia.png', endpoint: 'Asia/Jakarta'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Choose Location',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  WorldTime worldTime = locations[index];
                  updateTime(worldTime);
                },
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(locations[index].location),
              ),
            ),
          );
        },
        itemCount: locations.length,
      ),
    );
  }

  void updateTime(WorldTime data) async {
    Network network = Network();
    TimeData timeData = await network.getCurrentTimeDetails(data.endpoint);

    // Get properties from Data
    String dateTime = timeData.datetime!;
    String offset = timeData.utcOffset!;

    List<String> offsetDetails = offset.split(':');
    int offsetHour = int.parse(offsetDetails[0]);
    int offsetMinutes = int.parse(offsetDetails[1]);

    DateTime now = DateTime.parse(dateTime)
        .add(Duration(hours: offsetHour, minutes: offsetMinutes));

    bool isDayTime = (now.hour >= 6 && now.hour < 18) ? true : false;

    String currentTime = DateFormat.jm().format(now);

    data.time = currentTime;
    data.isDayTime = isDayTime;

    Navigator.pop(context, {
      'data': data,
    });
  }
}
