import 'package:dio/dio.dart';
import 'dart:async';

import 'package:softagi/shared/server/errors.dart';

abstract class DioHelper
{
  Future<dynamic> postData(String url, {dynamic data, String token});
}

class DioImpl extends DioHelper
{
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://fcm.googleapis.com/',
      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future postData(String url, {dynamic data, String token}) async
  {
    dio.options.headers =
    {
      'Content-Type':'application/json',
      'Authorization':'key=AAAAjELJUlQ:APA91bE_AMnz8hNXaIfTmoVuJdGbGGPy95s0nLRfX5FReErsb7Gx8LoHUmyAcaBi3o4yinTpMQbOCAY4yDEHSrgDGsWFW1lL6CCMv8FSaSkUZP3aLZ8SiQ1xrkrqSHPkll5fSOra60KJ',
    };

    return await _request(
          () async => await dio.post(url, data: data),
    );
  }
}

extension on DioHelper
{
  Future _request(Future<Response> request()) async
  {
    try
    {
      final r = await request.call();
      return r.data;
    } on DioError catch (e)
    {
      throw ServerException(e.response.data);
    } catch (e)
    {
      throw Exception();
    }
  }
}