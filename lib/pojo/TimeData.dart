import 'package:json_annotation/json_annotation.dart';

part 'TimeData.g.dart';

@JsonSerializable()
class TimeData {
  @JsonKey(name: 'abbreviation')
  String? abbreviation;
  @JsonKey(name: 'client_ip')
  String? clientIp;
  @JsonKey(name: 'datetime')
  String? datetime;
  @JsonKey(name: 'day_of_week')
  int? dayOfWeek;
  @JsonKey(name: 'day_of_year')
  int? dayOfYear;
  @JsonKey(name: 'dst')
  bool? dst;
  @JsonKey(name: 'dst_from')
  String? dstFrom;
  @JsonKey(name: 'dst_offset')
  int? dstOffset;
  @JsonKey(name: 'dst_until')
  String? dstUntil;
  @JsonKey(name: 'raw_offset')
  int? rawOffset;
  @JsonKey(name: 'timezone')
  String? timezone;
  @JsonKey(name: 'unixtime')
  int? unixtime;
  @JsonKey(name: 'utc_datetime')
  String? utcDatetime;
  @JsonKey(name: 'utc_offset')
  String? utcOffset;
  @JsonKey(name: 'week_number')
  int? weekNumber;

  TimeData(
      {this.abbreviation,
      this.clientIp,
      this.datetime,
      this.dayOfWeek,
      this.dayOfYear,
      this.dst,
      this.dstFrom,
      this.dstOffset,
      this.dstUntil,
      this.rawOffset,
      this.timezone,
      this.unixtime,
      this.utcDatetime,
      this.utcOffset,
      this.weekNumber});

  TimeData.Empty();

  factory TimeData.fromJson(Map<String, dynamic> json) =>
      _$TimeDataFromJson(json);

  Map<String, dynamic> toJson() => _$TimeDataToJson(this);
}
