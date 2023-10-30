// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_drinks_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteDrinksHiveModelAdapter
    extends TypeAdapter<FavoriteDrinksHiveModel> {
  @override
  final int typeId = 1;

  @override
  FavoriteDrinksHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteDrinksHiveModel()
      ..idDrink = fields[0] as String
      ..strDrink = fields[1] as String
      ..strDrinkThumb = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, FavoriteDrinksHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.idDrink)
      ..writeByte(1)
      ..write(obj.strDrink)
      ..writeByte(2)
      ..write(obj.strDrinkThumb);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteDrinksHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
