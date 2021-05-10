import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'deelnemers_record.g.dart';

abstract class DeelnemersRecord
    implements Built<DeelnemersRecord, DeelnemersRecordBuilder> {
  static Serializer<DeelnemersRecord> get serializer =>
      _$deelnemersRecordSerializer;

  @nullable
  bool get inactieve;

  @nullable
  String get ouderlink;

  @nullable
  String get zomerkamp;

  @nullable
  String get deelnemernaam;

  @nullable
  String get pasfoto;

  @nullable
  BuiltList<String> get ouderlist;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DeelnemersRecordBuilder builder) => builder
    ..inactieve = false
    ..ouderlink = ''
    ..zomerkamp = ''
    ..deelnemernaam = ''
    ..pasfoto = ''
    ..ouderlist = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deelnemers');

  static Stream<DeelnemersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DeelnemersRecord._();
  factory DeelnemersRecord([void Function(DeelnemersRecordBuilder) updates]) =
      _$DeelnemersRecord;
}

Map<String, dynamic> createDeelnemersRecordData({
  bool inactieve,
  String ouderlink,
  String zomerkamp,
  String deelnemernaam,
  String pasfoto,
}) =>
    serializers.serializeWith(
        DeelnemersRecord.serializer,
        DeelnemersRecord((d) => d
          ..inactieve = inactieve
          ..ouderlink = ouderlink
          ..zomerkamp = zomerkamp
          ..deelnemernaam = deelnemernaam
          ..pasfoto = pasfoto
          ..ouderlist = null));

DeelnemersRecord get dummyDeelnemersRecord {
  final builder = DeelnemersRecordBuilder()
    ..inactieve = dummyBoolean
    ..ouderlink = dummyString
    ..zomerkamp = dummyString
    ..deelnemernaam = dummyString
    ..pasfoto = dummyImagePath
    ..ouderlist = ListBuilder([dummyString, dummyString]);
  return builder.build();
}

List<DeelnemersRecord> createDummyDeelnemersRecord({int count}) =>
    List.generate(count, (_) => dummyDeelnemersRecord);
