import '../database.dart';

class ComentarioTable extends SupabaseTable<ComentarioRow> {
  @override
  String get tableName => 'comentario';

  @override
  ComentarioRow createRow(Map<String, dynamic> data) => ComentarioRow(data);
}

class ComentarioRow extends SupabaseDataRow {
  ComentarioRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ComentarioTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get texto => getField<String>('texto');
  set texto(String? value) => setField<String>('texto', value);

  String get idPostagem => getField<String>('id_postagem')!;
  set idPostagem(String value) => setField<String>('id_postagem', value);

  String get idUsuario => getField<String>('id_usuario')!;
  set idUsuario(String value) => setField<String>('id_usuario', value);
}
