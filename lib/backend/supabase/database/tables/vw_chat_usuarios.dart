import '../database.dart';

class VwChatUsuariosTable extends SupabaseTable<VwChatUsuariosRow> {
  @override
  String get tableName => 'vw_chat_usuarios';

  @override
  VwChatUsuariosRow createRow(Map<String, dynamic> data) =>
      VwChatUsuariosRow(data);
}

class VwChatUsuariosRow extends SupabaseDataRow {
  VwChatUsuariosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwChatUsuariosTable();

  int? get chatId => getField<int>('chat_id');
  set chatId(int? value) => setField<int>('chat_id', value);

  List<String> get idsUsuarios => getListField<String>('ids_usuarios');
  set idsUsuarios(List<String>? value) =>
      setListField<String>('ids_usuarios', value);

  List<String> get nomesUsuarios => getListField<String>('nomes_usuarios');
  set nomesUsuarios(List<String>? value) =>
      setListField<String>('nomes_usuarios', value);

  List<String> get fotosUsuarios => getListField<String>('fotos_usuarios');
  set fotosUsuarios(List<String>? value) =>
      setListField<String>('fotos_usuarios', value);
}
