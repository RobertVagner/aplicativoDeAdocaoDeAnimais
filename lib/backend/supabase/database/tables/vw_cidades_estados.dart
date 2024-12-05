import '../database.dart';

class VwCidadesEstadosTable extends SupabaseTable<VwCidadesEstadosRow> {
  @override
  String get tableName => 'vw_cidades_estados';

  @override
  VwCidadesEstadosRow createRow(Map<String, dynamic> data) =>
      VwCidadesEstadosRow(data);
}

class VwCidadesEstadosRow extends SupabaseDataRow {
  VwCidadesEstadosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VwCidadesEstadosTable();

  String? get cidadeName => getField<String>('cidade_name');
  set cidadeName(String? value) => setField<String>('cidade_name', value);

  String? get ufCode => getField<String>('uf_code');
  set ufCode(String? value) => setField<String>('uf_code', value);

  int? get cidadeUf => getField<int>('cidade_uf');
  set cidadeUf(int? value) => setField<int>('cidade_uf', value);

  int? get municipio => getField<int>('municipio');
  set municipio(int? value) => setField<int>('municipio', value);

  String? get estadoName => getField<String>('estado_name');
  set estadoName(String? value) => setField<String>('estado_name', value);

  int? get estadoUf => getField<int>('estado_uf');
  set estadoUf(int? value) => setField<int>('estado_uf', value);
}
