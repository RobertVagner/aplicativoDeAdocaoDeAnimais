import '../database.dart';

class MensagemTable extends SupabaseTable<MensagemRow> {
  @override
  String get tableName => 'mensagem';

  @override
  MensagemRow createRow(Map<String, dynamic> data) => MensagemRow(data);
}

class MensagemRow extends SupabaseDataRow {
  MensagemRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MensagemTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get mensagemTexto => getField<String>('mensagem_texto');
  set mensagemTexto(String? value) => setField<String>('mensagem_texto', value);

  String? get remetenteId => getField<String>('remetente_id');
  set remetenteId(String? value) => setField<String>('remetente_id', value);

  int? get recebedorId => getField<int>('recebedor_id');
  set recebedorId(int? value) => setField<int>('recebedor_id', value);

  String? get imgPath => getField<String>('img_path');
  set imgPath(String? value) => setField<String>('img_path', value);

  bool get isImg => getField<bool>('is_img')!;
  set isImg(bool value) => setField<bool>('is_img', value);
}
