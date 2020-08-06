import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        url: 'Europe/Amsterdam',
        location: 'Amsterdam',
        flag: 'netherlands.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Europe/Belgrade', location: 'Belgrade', flag: 'serbia.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(
        url: 'Europe/Brussels', location: 'Brussels', flag: 'belgium.png'),
    WorldTime(
        url: 'Europe/Budapest', location: 'Budapest', flag: 'hungary.png'),
    WorldTime(
        url: 'Europe/Copenhagen', location: 'Copenhagen', flag: 'denmark.png'),
    WorldTime(url: 'Europe/Dublin', location: 'Dublin', flag: 'ireland.png'),
    WorldTime(
        url: 'Europe/Helsinki', location: 'Helsinki', flag: 'finland.png'),
    WorldTime(url: 'Europe/Istanbul', location: 'Istanbul', flag: 'turkey.png'),
    WorldTime(url: 'Europe/Kiev', location: 'Kiev', flag: 'ukraine.png'),
    WorldTime(url: 'Europe/Lisbon', location: 'Lisbon', flag: 'portugal.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'england.png'),
    WorldTime(
        url: 'Europe/Luxembourg',
        location: 'Luxembourg',
        flag: 'luxembourg.png'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.png'),
    WorldTime(url: 'Europe/Malta', location: 'Malta', flag: 'malta.png'),
    WorldTime(url: 'Europe/Minsk', location: 'Minsk', flag: 'belarus.png'),
    WorldTime(url: 'Europe/Monaco', location: 'Monaco', flag: 'monaco.png'),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: 'russia.png'),
    WorldTime(url: 'Europe/Oslo', location: 'Oslo', flag: 'finland.png'),
    WorldTime(url: 'Europe/Paris', location: 'Paris', flag: 'france.png'),
    WorldTime(
        url: 'Europe/Prague', location: 'Prague', flag: 'czech-republic.png'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'italy.png'),
    WorldTime(url: 'Europe/Sofia', location: 'Sofia', flag: 'bulgaria.png'),
    WorldTime(
        url: 'Europe/Stockholm', location: 'Stockholm', flag: 'sweden.png'),
    WorldTime(url: 'Europe/Vienna', location: 'Vienna', flag: 'austria.png'),
    WorldTime(
        url: 'Europe/Zurich', location: 'Zurich', flag: 'switzerland.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onLongPress: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
