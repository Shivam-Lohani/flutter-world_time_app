class WorldTime {
  late String location;
  late String flag;
  late String endpoint;
  late String time;
  late bool isDayTime;

  WorldTime(
      {required this.location,
      required this.flag,
      required this.endpoint,
      required this.time,
      required this.isDayTime});

  WorldTime.listData(
      {required this.location, required this.flag, required this.endpoint});

  WorldTime.data(
      {required this.location,
      required this.flag,
      required this.time,
      required this.isDayTime});
}
