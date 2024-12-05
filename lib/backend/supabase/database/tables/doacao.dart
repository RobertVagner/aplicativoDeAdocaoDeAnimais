import '../database.dart';

class DoacaoTable extends SupabaseTable<DoacaoRow> {
  @override
  String get tableName => 'doacao';

  @override
  DoacaoRow createRow(Map<String, dynamic> data) => DoacaoRow(data);
}

class DoacaoRow extends SupabaseDataRow {
  DoacaoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DoacaoTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get nomeProduto => getField<String>('nomeProduto');
  set nomeProduto(String? value) => setField<String>('nomeProduto', value);

  String? get valorProduto => getField<String>('valorProduto');
  set valorProduto(String? value) => setField<String>('valorProduto', value);

  String? get idOng => getField<String>('id_ong');
  set idOng(String? value) => setField<String>('id_ong', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);
}
