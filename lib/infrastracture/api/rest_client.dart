import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://date.nager.at/api/v3/')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/publicholidays/{year}/{country}')
  Future<List<Holiday>> getHolidays(
    @Path('year') int year,
    @Path('country') String country,
  );
}

@JsonSerializable()
class Holiday {
  Holiday({
    this.date,
    this.localName,
    this.name,
    this.countryCode,
    this.AT,
    this.global,
    this.counties,
    this.launchYear,
    this.types,
  });

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);

  final String? date;
  final String? localName;
  final String? name;
  final String? countryCode;
  final String? AT;
  final bool? global;
  final String? counties;
  final int? launchYear;
  final List<String>? types;

  Map<String, dynamic> toJson() => _$HolidayToJson(this);
}
