// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_answer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RankingAnswerModelAdapter extends TypeAdapter<RankingAnswerModel> {
  @override
  final int typeId = 1;

  @override
  RankingAnswerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RankingAnswerModel(
      answer: fields[1] as String?,
      question: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RankingAnswerModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.question)
      ..writeByte(1)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RankingAnswerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
