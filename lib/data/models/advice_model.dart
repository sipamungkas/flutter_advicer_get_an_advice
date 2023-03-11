import 'package:advicer/domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

/// model is just a DTO (Data Transfer Object)

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({required int id, required String advice})
      : super(id: id, advice: advice);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(id: json['id'], advice: json['advice']);
  }
}
