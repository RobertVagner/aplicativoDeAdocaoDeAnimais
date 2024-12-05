import '../database.dart';

class VwPostagensTable extends SupabaseTable<VwPostagensRow> {
  @override
  String get tableName => 'vw_postagens';

  @override
  VwPostagensRow createRow(Map<String, dynamic> data) => VwPostagensRow(data);
}

class VwPostagensRow extends SupabaseDataRow {
  VwPostagensRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwPostagensTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get texto => getField<String>('texto');
  set texto(String? value) => setField<String>('texto', value);

  String? get idUsuario => getField<String>('id_usuario');
  set idUsuario(String? value) => setField<String>('id_usuario', value);

  List<String> get fotos => getListField<String>('fotos');
  set fotos(List<String>? value) => setListField<String>('fotos', value);

  bool? get postagemPerdidos => getField<bool>('postagem_perdidos');
  set postagemPerdidos(bool? value) =>
      setField<bool>('postagem_perdidos', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get nomeAnimal => getField<String>('nomeAnimal');
  set nomeAnimal(String? value) => setField<String>('nomeAnimal', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get fotoPerfilUsuario => getField<String>('foto_perfil_usuario');
  set fotoPerfilUsuario(String? value) =>
      setField<String>('foto_perfil_usuario', value);
}
