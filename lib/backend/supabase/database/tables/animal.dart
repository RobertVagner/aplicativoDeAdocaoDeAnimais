import '../database.dart';

class AnimalTable extends SupabaseTable<AnimalRow> {
  @override
  String get tableName => 'animal';

  @override
  AnimalRow createRow(Map<String, dynamic> data) => AnimalRow(data);
}

class AnimalRow extends SupabaseDataRow {
  AnimalRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AnimalTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get dataNasc => getField<String>('data_nasc');
  set dataNasc(String? value) => setField<String>('data_nasc', value);

  String? get cor => getField<String>('cor');
  set cor(String? value) => setField<String>('cor', value);

  String? get raca => getField<String>('raca');
  set raca(String? value) => setField<String>('raca', value);

  String? get genero => getField<String>('genero');
  set genero(String? value) => setField<String>('genero', value);

  String? get tipoAnimal => getField<String>('tipo_animal');
  set tipoAnimal(String? value) => setField<String>('tipo_animal', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String? get idUsuario => getField<String>('id_usuario');
  set idUsuario(String? value) => setField<String>('id_usuario', value);
}
