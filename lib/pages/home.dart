import 'package:flutter/material.dart';
import 'package:world_time_app/pojo/world_time.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    WorldTime worldTime = data['data'];

    String bgImage = worldTime.isDayTime ? 'day.png' : 'night.png';
    Color bgColor = worldTime.isDayTime ? Colors.blue : Colors.indigo;
    String flag = worldTime.flag;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/choose_location');

                    setState(() {
                      data = result;
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: Colors.grey[300]),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/$flag'),
                    radius: 20.0,
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    worldTime.location,
                    style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white),
                  ),
                ]),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  worldTime.time,
                  style: const TextStyle(fontSize: 66.0, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
