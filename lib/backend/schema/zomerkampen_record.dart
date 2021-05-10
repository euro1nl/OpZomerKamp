import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'zomerkampen_record.g.dart';

abstract class ZomerkampenRecord
    implements Built<ZomerkampenRecord, ZomerkampenRecordBuilder> {
  static Serializer<ZomerkampenRecord> get serializer =>
      _$zomerkampenRecordSerializer;

  @nullable
  String get kampnaam;

  @nullable
  String get kampweek;

  @nullable
  Timestamp get startdatum;

  @nullable
  Timestamp get einddatum;

  @nullable
  int get kampid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ZomerkampenRecordBuilder builder) => builder
    ..kampnaam = ''
    ..kampweek = ''
    ..kampid = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('zomerkampen');

  static Stream<ZomerkampenRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ZomerkampenRecord._();
  factory ZomerkampenRecord([void Function(ZomerkampenRecordBuilder) updates]) =
      _$ZomerkampenRecord;
}

Map<String, dynamic> createZomerkampenRecordData({
  String kampnaam,
  String kampweek,
  Timestamp startdatum,
  Timestamp einddatum,
  int kampid,
}) =>
    serializers.serializeWith(
        ZomerkampenRecord.serializer,
        ZomerkampenRecord((z) => z
          ..kampnaam = kampnaam
          ..kampweek = kampweek
          ..startdatum = startdatum
          ..einddatum = einddatum
          ..kampid = kampid));

ZomerkampenRecord get dummyZomerkampenRecord {
  final builder = ZomerkampenRecordBuilder()
    ..kampnaam = dummyString
    ..kampweek = dummyString
    ..startdatum = dummyTimestamp
    ..einddatum = dummyTimestamp
    ..kampid = dummyInteger;
  return builder.build();
}

List<ZomerkampenRecord> createDummyZomerkampenRecord({int count}) =>
    List.generate(count, (_) => dummyZomerkampenRecord);
