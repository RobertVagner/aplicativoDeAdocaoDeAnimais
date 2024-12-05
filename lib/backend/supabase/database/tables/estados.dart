import '../database.dart';

class EstadosTable extends SupabaseTable<EstadosRow> {
  @override
  String get tableName => 'estados';

  @override
  EstadosRow createRow(Map<String, dynamic> data) => EstadosRow(data);
}

class EstadosRow extends SupabaseDataRow {
  EstadosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EstadosTable();

  int? get uf => getField<int>('uf');
  set uf(int? value) => setField<int>('uf', value);

  String? get ufCode => getField<String>('uf_code');
  set ufCode(String? value) => setField<String>('uf_code', value);

  String? get iso31662 => getField<String>('iso3166-2');
  set iso31662(String? value) => setField<String>('iso3166-2', value);

  int? get osmRelationId => getField<int>('osm_relation_id');
  set osmRelationId(int? value) => setField<int>('osm_relation_id', value);

  String? get wikidataId => getField<String>('wikidata_id');
  set wikidataId(String? value) => setField<String>('wikidata_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get noAccents => getField<String>('no_accents');
  set noAccents(String? value) => setField<String>('no_accents', value);

  String? get gentilic => getField<String>('gentilic');
  set gentilic(String? value) => setField<String>('gentilic', value);

  String? get gentilicAlternative => getField<String>('gentilic_alternative');
  set gentilicAlternative(String? value) =>
      setField<String>('gentilic_alternative', value);

  String? get macroregion => getField<String>('macroregion');
  set macroregion(String? value) => setField<String>('macroregion', value);

  String? get wikipediaPt => getField<String>('wikipedia_pt');
  set wikipediaPt(String? value) => setField<String>('wikipedia_pt', value);

  String? get website => getField<String>('website');
  set website(String? value) => setField<String>('website', value);

  String? get timezone => getField<String>('timezone');
  set timezone(String? value) => setField<String>('timezone', value);

  String? get flagImage => getField<String>('flag_image');
  set flagImage(String? value) => setField<String>('flag_image', value);
}
