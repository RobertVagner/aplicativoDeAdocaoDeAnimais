import '../database.dart';

class VacinaTable extends SupabaseTable<VacinaRow> {
  @override
  String get tableName => 'vacina';

  @override
  VacinaRow createRow(Map<String, dynamic> data) => VacinaRow(data);
}

class VacinaRow extends SupabaseDataRow {
  VacinaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VacinaTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  String get dataVacinacaoAtual => getField<String>('data_vacinacao_atual')!;
  set dataVacinacaoAtual(String value) =>
      setField<String>('data_vacinacao_atual', value);

  String get responsavel => getField<String>('responsavel')!;
  set responsavel(String value) => setField<String>('responsavel', value);

  String get peso => getField<String>('peso')!;
  set peso(String value) => setField<String>('peso', value);

  String get idAnimal => getField<String>('id_animal')!;
  set idAnimal(String value) => setField<String>('id_animal', value);

  String get idUsuario => getField<String>('id_usuario')!;
  set idUsuario(String value) => setField<String>('id_usuario', value);

  String get dataVacinacaoProxima =>
      getField<String>('data_vacinacao_proxima')!;
  set dataVacinacaoProxima(String value) =>
      setField<String>('data_vacinacao_proxima', value);

  String get unidade => getField<String>('unidade')!;
  set unidade(String value) => setField<String>('unidade', value);
}
