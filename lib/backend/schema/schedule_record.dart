import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduleRecord extends FirestoreRecord {
  ScheduleRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "schedule" field.
  List<ScheduleStruct>? _schedule;
  List<ScheduleStruct> get schedule => _schedule ?? const [];
  bool hasSchedule() => _schedule != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "birthday" field.
  String? _birthday;
  String get birthday => _birthday ?? '';
  bool hasBirthday() => _birthday != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  // "instrument" field.
  String? _instrument;
  String get instrument => _instrument ?? '';
  bool hasInstrument() => _instrument != null;

  // "teacherName" field.
  String? _teacherName;
  String get teacherName => _teacherName ?? '';
  bool hasTeacherName() => _teacherName != null;

  // "teacherRef" field.
  DocumentReference? _teacherRef;
  DocumentReference? get teacherRef => _teacherRef;
  bool hasTeacherRef() => _teacherRef != null;

  void _initializeFields() {
    _schedule = getStructList(
      snapshotData['schedule'],
      ScheduleStruct.fromMap,
    );
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _birthday = snapshotData['birthday'] as String?;
    _number = castToType<int>(snapshotData['number']);
    _instrument = snapshotData['instrument'] as String?;
    _teacherName = snapshotData['teacherName'] as String?;
    _teacherRef = snapshotData['teacherRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('schedule');

  static Stream<ScheduleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScheduleRecord.fromSnapshot(s));

  static Future<ScheduleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScheduleRecord.fromSnapshot(s));

  static ScheduleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScheduleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScheduleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScheduleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScheduleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScheduleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScheduleRecordData({
  String? name,
  String? address,
  String? birthday,
  int? number,
  String? instrument,
  String? teacherName,
  DocumentReference? teacherRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'address': address,
      'birthday': birthday,
      'number': number,
      'instrument': instrument,
      'teacherName': teacherName,
      'teacherRef': teacherRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScheduleRecordDocumentEquality implements Equality<ScheduleRecord> {
  const ScheduleRecordDocumentEquality();

  @override
  bool equals(ScheduleRecord? e1, ScheduleRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.schedule, e2?.schedule) &&
        e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.birthday == e2?.birthday &&
        e1?.number == e2?.number &&
        e1?.instrument == e2?.instrument &&
        e1?.teacherName == e2?.teacherName &&
        e1?.teacherRef == e2?.teacherRef;
  }

  @override
  int hash(ScheduleRecord? e) => const ListEquality().hash([
        e?.schedule,
        e?.name,
        e?.address,
        e?.birthday,
        e?.number,
        e?.instrument,
        e?.teacherName,
        e?.teacherRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ScheduleRecord;
}
