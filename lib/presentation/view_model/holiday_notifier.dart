import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../infrastracture/api/rest_client.dart';

part 'holiday_notifier.g.dart';

@riverpod
class HolidayNotifier extends _$HolidayNotifier {
  @override
  Holiday? build() => Holiday();

  void fetch() async {
    final dio = Dio();
    final client = RestClient(dio);

    final holidays = await client.getHolidays(DateTime.now().year, 'JP');
    state = holidays.first;
  }
}
