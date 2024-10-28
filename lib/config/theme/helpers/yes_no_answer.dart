
import 'package:dio/dio.dart';
import 'package:yes_or_no/domain/entities/messages.dart';
import 'package:yes_or_no/infrastructure/models/yes_no_model.dart';

class GetYesNoanswer { 

  final _dio = Dio();
  Future<Messages> getAnswer() async { 

    final response = await _dio.get('https://yesno.wtf/api');

    final yesnomodel = YesNoModel.fromJsonMap(response.data);

    return yesnomodel.toMessageEntitie();

   }
 }