// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TimeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeData _$TimeDataFromJson(Map<String, dynamic> json) => TimeData(
      abbreviation: json['abbreviation'] as String?,
      clientIp: json['client_ip'] as String?,
      datetime: json['datetime'] as String?,
      dayOfWeek: json['day_of_week'] as int?,
      dayOfYear: json['day_of_year'] as int?,
      dst: json['dst'] as bool?,
      dstFrom: json['dst_from'] as String?,
      dstOffset: json['dst_offset'] as int?,
      dstUntil: json['dst_until'] as String?,
      rawOffset: json['raw_offset'] as int?,
      timezone: json['timezone'] as String?,
      unixtime: json['unixtime'] as int?,
      utcDatetime: json['utc_datetime'] as String?,
      utcOffset: json['utc_offset'] as String?,
      weekNumber: json['week_number'] as int?,
    );

Map<String, dynamic> _$TimeDataToJson(TimeData instance) => <String, dynamic>{
      'abbreviation': instance.abbreviation,
      'client_ip': instance.clientIp,
      'datetime': instance.datetime,
      'day_of_week': instance.dayOfWeek,
      'day_of_year': instance.dayOfYear,
      'dst': instance.dst,
      'dst_from': instance.dstFrom,
      'dst_offset': instance.dstOffset,
      'dst_until': instance.dstUntil,
      'raw_offset': instance.rawOffset,
      'timezone': instance.timezone,
      'unixtime': instance.unixtime,
      'utc_datetime': instance.utcDatetime,
      'utc_offset': instance.utcOffset,
      'week_number': instance.weekNumber,
    };
