import '../database.dart';

class CidadesBrTable extends SupabaseTable<CidadesBrRow> {
  @override
  String get tableName => 'cidades_br';

  @override
  CidadesBrRow createRow(Map<String, dynamic> data) => CidadesBrRow(data);
}

class CidadesBrRow extends SupabaseDataRow {
  CidadesBrRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CidadesBrTable();

  int? get municipio => getField<int>('municipio');
  set municipio(int? value) => setField<int>('municipio', value);

  int? get uf => getField<int>('uf');
  set uf(int? value) => setField<int>('uf', value);

  String? get ufCode => getField<String>('uf_code');
  set ufCode(String? value) => setField<String>('uf_code', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get mesoregion => getField<int>('mesoregion');
  set mesoregion(int? value) => setField<int>('mesoregion', value);

  int? get microregion => getField<int>('microregion');
  set microregion(int? value) => setField<int>('microregion', value);

  int? get rgint => getField<int>('rgint');
  set rgint(int? value) => setField<int>('rgint', value);

  int? get rgi => getField<int>('rgi');
  set rgi(int? value) => setField<int>('rgi', value);

  int? get osmRelationId => getField<int>('osm_relation_id');
  set osmRelationId(int? value) => setField<int>('osm_relation_id', value);

  String? get wikidataId => getField<String>('wikidata_id');
  set wikidataId(String? value) => setField<String>('wikidata_id', value);

  String? get isCapital => getField<String>('is_capital');
  set isCapital(String? value) => setField<String>('is_capital', value);

  String? get wikipediaPt => getField<String>('wikipedia_pt');
  set wikipediaPt(String? value) => setField<String>('wikipedia_pt', value);

  double? get lon => getField<double>('lon');
  set lon(double? value) => setField<double>('lon', value);

  double? get lat => getField<double>('lat');
  set lat(double? value) => setField<double>('lat', value);

  String? get noAccents => getField<String>('no_accents');
  set noAccents(String? value) => setField<String>('no_accents', value);

  String? get slugName => getField<String>('slug_name');
  set slugName(String? value) => setField<String>('slug_name', value);

  String? get alternativeNames => getField<String>('alternative_names');
  set alternativeNames(String? value) =>
      setField<String>('alternative_names', value);

  int? get pop21 => getField<int>('pop_21');
  set pop21(int? value) => setField<int>('pop_21', value);
}
