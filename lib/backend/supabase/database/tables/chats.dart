import '../database.dart';

class ChatsTable extends SupabaseTable<ChatsRow> {
  @override
  String get tableName => 'chats';

  @override
  ChatsRow createRow(Map<String, dynamic> data) => ChatsRow(data);
}

class ChatsRow extends SupabaseDataRow {
  ChatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get chatNome => getField<String>('chat_nome');
  set chatNome(String? value) => setField<String>('chat_nome', value);

  String? get chatDescricao => getField<String>('chat_descricao');
  set chatDescricao(String? value) => setField<String>('chat_descricao', value);

  String? get chatImg => getField<String>('chat_img');
  set chatImg(String? value) => setField<String>('chat_img', value);

  List<String> get chatMembros => getListField<String>('chat_membros');
  set chatMembros(List<String>? value) =>
      setListField<String>('chat_membros', value);

  String? get ultimaMensagem => getField<String>('ultima_mensagem');
  set ultimaMensagem(String? value) =>
      setField<String>('ultima_mensagem', value);

  DateTime? get ultimaMensagemHora =>
      getField<DateTime>('ultima_mensagem_hora');
  set ultimaMensagemHora(DateTime? value) =>
      setField<DateTime>('ultima_mensagem_hora', value);

  bool get isChatGroup => getField<bool>('is_chat_group')!;
  set isChatGroup(bool value) => setField<bool>('is_chat_group', value);

  String? get sortedChatMembros => getField<String>('sorted_chat_membros');
  set sortedChatMembros(String? value) =>
      setField<String>('sorted_chat_membros', value);
}
