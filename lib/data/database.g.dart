// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BarnsTable extends Barns with TableInfo<$BarnsTable, Barn> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BarnsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ownerIdMeta =
      const VerificationMeta('ownerId');
  @override
  late final GeneratedColumn<int> ownerId = GeneratedColumn<int>(
      'owner_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES owners(id) ON DELETE SET NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _photoPathMeta =
      const VerificationMeta('photoPath');
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
      'photo_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, ownerId, name, address, photoPath, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'barns';
  @override
  VerificationContext validateIntegrity(Insertable<Barn> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('owner_id')) {
      context.handle(_ownerIdMeta,
          ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('photo_path')) {
      context.handle(_photoPathMeta,
          photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Barn map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Barn(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ownerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}owner_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      photoPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_path']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $BarnsTable createAlias(String alias) {
    return $BarnsTable(attachedDatabase, alias);
  }
}

class Barn extends DataClass implements Insertable<Barn> {
  final int id;
  final int? ownerId;
  final String? name;
  final String? address;
  final String? photoPath;
  final String? notes;
  const Barn(
      {required this.id,
      this.ownerId,
      this.name,
      this.address,
      this.photoPath,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || ownerId != null) {
      map['owner_id'] = Variable<int>(ownerId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  BarnsCompanion toCompanion(bool nullToAbsent) {
    return BarnsCompanion(
      id: Value(id),
      ownerId: ownerId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory Barn.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Barn(
      id: serializer.fromJson<int>(json['id']),
      ownerId: serializer.fromJson<int?>(json['ownerId']),
      name: serializer.fromJson<String?>(json['name']),
      address: serializer.fromJson<String?>(json['address']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ownerId': serializer.toJson<int?>(ownerId),
      'name': serializer.toJson<String?>(name),
      'address': serializer.toJson<String?>(address),
      'photoPath': serializer.toJson<String?>(photoPath),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Barn copyWith(
          {int? id,
          Value<int?> ownerId = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> photoPath = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      Barn(
        id: id ?? this.id,
        ownerId: ownerId.present ? ownerId.value : this.ownerId,
        name: name.present ? name.value : this.name,
        address: address.present ? address.value : this.address,
        photoPath: photoPath.present ? photoPath.value : this.photoPath,
        notes: notes.present ? notes.value : this.notes,
      );
  Barn copyWithCompanion(BarnsCompanion data) {
    return Barn(
      id: data.id.present ? data.id.value : this.id,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Barn(')
          ..write('id: $id, ')
          ..write('ownerId: $ownerId, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('photoPath: $photoPath, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ownerId, name, address, photoPath, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Barn &&
          other.id == this.id &&
          other.ownerId == this.ownerId &&
          other.name == this.name &&
          other.address == this.address &&
          other.photoPath == this.photoPath &&
          other.notes == this.notes);
}

class BarnsCompanion extends UpdateCompanion<Barn> {
  final Value<int> id;
  final Value<int?> ownerId;
  final Value<String?> name;
  final Value<String?> address;
  final Value<String?> photoPath;
  final Value<String?> notes;
  const BarnsCompanion({
    this.id = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.notes = const Value.absent(),
  });
  BarnsCompanion.insert({
    this.id = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.notes = const Value.absent(),
  });
  static Insertable<Barn> custom({
    Expression<int>? id,
    Expression<int>? ownerId,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? photoPath,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerId != null) 'owner_id': ownerId,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (photoPath != null) 'photo_path': photoPath,
      if (notes != null) 'notes': notes,
    });
  }

  BarnsCompanion copyWith(
      {Value<int>? id,
      Value<int?>? ownerId,
      Value<String?>? name,
      Value<String?>? address,
      Value<String?>? photoPath,
      Value<String?>? notes}) {
    return BarnsCompanion(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      address: address ?? this.address,
      photoPath: photoPath ?? this.photoPath,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<int>(ownerId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BarnsCompanion(')
          ..write('id: $id, ')
          ..write('ownerId: $ownerId, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('photoPath: $photoPath, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $OwnersTable extends Owners with TableInfo<$OwnersTable, Owner> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OwnersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, phone, email, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'owners';
  @override
  VerificationContext validateIntegrity(Insertable<Owner> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Owner map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Owner(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $OwnersTable createAlias(String alias) {
    return $OwnersTable(attachedDatabase, alias);
  }
}

class Owner extends DataClass implements Insertable<Owner> {
  final int id;
  final String name;
  final String? phone;
  final String? email;
  final String? notes;
  const Owner(
      {required this.id,
      required this.name,
      this.phone,
      this.email,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  OwnersCompanion toCompanion(bool nullToAbsent) {
    return OwnersCompanion(
      id: Value(id),
      name: Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory Owner.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Owner(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Owner copyWith(
          {int? id,
          String? name,
          Value<String?> phone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      Owner(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        notes: notes.present ? notes.value : this.notes,
      );
  Owner copyWithCompanion(OwnersCompanion data) {
    return Owner(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Owner(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone, email, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Owner &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.notes == this.notes);
}

class OwnersCompanion extends UpdateCompanion<Owner> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> notes;
  const OwnersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.notes = const Value.absent(),
  });
  OwnersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.notes = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Owner> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (notes != null) 'notes': notes,
    });
  }

  OwnersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String?>? notes}) {
    return OwnersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OwnersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $OwnerBarnsTable extends OwnerBarns
    with TableInfo<$OwnerBarnsTable, OwnerBarn> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OwnerBarnsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ownerIdMeta =
      const VerificationMeta('ownerId');
  @override
  late final GeneratedColumn<int> ownerId = GeneratedColumn<int>(
      'owner_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES owners(id) ON DELETE CASCADE');
  static const VerificationMeta _barnIdMeta = const VerificationMeta('barnId');
  @override
  late final GeneratedColumn<int> barnId = GeneratedColumn<int>(
      'barn_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES barns(id) ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns => [ownerId, barnId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'owner_barns';
  @override
  VerificationContext validateIntegrity(Insertable<OwnerBarn> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('owner_id')) {
      context.handle(_ownerIdMeta,
          ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta));
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('barn_id')) {
      context.handle(_barnIdMeta,
          barnId.isAcceptableOrUnknown(data['barn_id']!, _barnIdMeta));
    } else if (isInserting) {
      context.missing(_barnIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ownerId, barnId};
  @override
  OwnerBarn map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OwnerBarn(
      ownerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}owner_id'])!,
      barnId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}barn_id'])!,
    );
  }

  @override
  $OwnerBarnsTable createAlias(String alias) {
    return $OwnerBarnsTable(attachedDatabase, alias);
  }
}

class OwnerBarn extends DataClass implements Insertable<OwnerBarn> {
  final int ownerId;
  final int barnId;
  const OwnerBarn({required this.ownerId, required this.barnId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['owner_id'] = Variable<int>(ownerId);
    map['barn_id'] = Variable<int>(barnId);
    return map;
  }

  OwnerBarnsCompanion toCompanion(bool nullToAbsent) {
    return OwnerBarnsCompanion(
      ownerId: Value(ownerId),
      barnId: Value(barnId),
    );
  }

  factory OwnerBarn.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OwnerBarn(
      ownerId: serializer.fromJson<int>(json['ownerId']),
      barnId: serializer.fromJson<int>(json['barnId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ownerId': serializer.toJson<int>(ownerId),
      'barnId': serializer.toJson<int>(barnId),
    };
  }

  OwnerBarn copyWith({int? ownerId, int? barnId}) => OwnerBarn(
        ownerId: ownerId ?? this.ownerId,
        barnId: barnId ?? this.barnId,
      );
  OwnerBarn copyWithCompanion(OwnerBarnsCompanion data) {
    return OwnerBarn(
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      barnId: data.barnId.present ? data.barnId.value : this.barnId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OwnerBarn(')
          ..write('ownerId: $ownerId, ')
          ..write('barnId: $barnId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ownerId, barnId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OwnerBarn &&
          other.ownerId == this.ownerId &&
          other.barnId == this.barnId);
}

class OwnerBarnsCompanion extends UpdateCompanion<OwnerBarn> {
  final Value<int> ownerId;
  final Value<int> barnId;
  final Value<int> rowid;
  const OwnerBarnsCompanion({
    this.ownerId = const Value.absent(),
    this.barnId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OwnerBarnsCompanion.insert({
    required int ownerId,
    required int barnId,
    this.rowid = const Value.absent(),
  })  : ownerId = Value(ownerId),
        barnId = Value(barnId);
  static Insertable<OwnerBarn> custom({
    Expression<int>? ownerId,
    Expression<int>? barnId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ownerId != null) 'owner_id': ownerId,
      if (barnId != null) 'barn_id': barnId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OwnerBarnsCompanion copyWith(
      {Value<int>? ownerId, Value<int>? barnId, Value<int>? rowid}) {
    return OwnerBarnsCompanion(
      ownerId: ownerId ?? this.ownerId,
      barnId: barnId ?? this.barnId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ownerId.present) {
      map['owner_id'] = Variable<int>(ownerId.value);
    }
    if (barnId.present) {
      map['barn_id'] = Variable<int>(barnId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OwnerBarnsCompanion(')
          ..write('ownerId: $ownerId, ')
          ..write('barnId: $barnId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HorsesTable extends Horses with TableInfo<$HorsesTable, Horse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HorsesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ownerIdMeta =
      const VerificationMeta('ownerId');
  @override
  late final GeneratedColumn<int> ownerId = GeneratedColumn<int>(
      'owner_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES owners(id) ON DELETE SET NULL');
  static const VerificationMeta _barnIdMeta = const VerificationMeta('barnId');
  @override
  late final GeneratedColumn<int> barnId = GeneratedColumn<int>(
      'barn_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NULL REFERENCES barns(id) ON DELETE SET NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _photoPathMeta =
      const VerificationMeta('photoPath');
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
      'photo_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reminderIntervalWeeksMeta =
      const VerificationMeta('reminderIntervalWeeks');
  @override
  late final GeneratedColumn<int> reminderIntervalWeeks = GeneratedColumn<int>(
      'reminder_interval_weeks', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(4));
  static const VerificationMeta _lastServicedDateMeta =
      const VerificationMeta('lastServicedDate');
  @override
  late final GeneratedColumn<DateTime> lastServicedDate =
      GeneratedColumn<DateTime>('last_serviced_date', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        ownerId,
        barnId,
        name,
        notes,
        photoPath,
        reminderIntervalWeeks,
        lastServicedDate
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'horses';
  @override
  VerificationContext validateIntegrity(Insertable<Horse> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('owner_id')) {
      context.handle(_ownerIdMeta,
          ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta));
    }
    if (data.containsKey('barn_id')) {
      context.handle(_barnIdMeta,
          barnId.isAcceptableOrUnknown(data['barn_id']!, _barnIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('photo_path')) {
      context.handle(_photoPathMeta,
          photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta));
    }
    if (data.containsKey('reminder_interval_weeks')) {
      context.handle(
          _reminderIntervalWeeksMeta,
          reminderIntervalWeeks.isAcceptableOrUnknown(
              data['reminder_interval_weeks']!, _reminderIntervalWeeksMeta));
    }
    if (data.containsKey('last_serviced_date')) {
      context.handle(
          _lastServicedDateMeta,
          lastServicedDate.isAcceptableOrUnknown(
              data['last_serviced_date']!, _lastServicedDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Horse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Horse(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ownerId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}owner_id']),
      barnId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}barn_id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      photoPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo_path']),
      reminderIntervalWeeks: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}reminder_interval_weeks'])!,
      lastServicedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_serviced_date']),
    );
  }

  @override
  $HorsesTable createAlias(String alias) {
    return $HorsesTable(attachedDatabase, alias);
  }
}

class Horse extends DataClass implements Insertable<Horse> {
  final int id;
  final int? ownerId;
  final int? barnId;
  final String name;
  final String? notes;
  final String? photoPath;
  final int reminderIntervalWeeks;
  final DateTime? lastServicedDate;
  const Horse(
      {required this.id,
      this.ownerId,
      this.barnId,
      required this.name,
      this.notes,
      this.photoPath,
      required this.reminderIntervalWeeks,
      this.lastServicedDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || ownerId != null) {
      map['owner_id'] = Variable<int>(ownerId);
    }
    if (!nullToAbsent || barnId != null) {
      map['barn_id'] = Variable<int>(barnId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || photoPath != null) {
      map['photo_path'] = Variable<String>(photoPath);
    }
    map['reminder_interval_weeks'] = Variable<int>(reminderIntervalWeeks);
    if (!nullToAbsent || lastServicedDate != null) {
      map['last_serviced_date'] = Variable<DateTime>(lastServicedDate);
    }
    return map;
  }

  HorsesCompanion toCompanion(bool nullToAbsent) {
    return HorsesCompanion(
      id: Value(id),
      ownerId: ownerId == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerId),
      barnId:
          barnId == null && nullToAbsent ? const Value.absent() : Value(barnId),
      name: Value(name),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      photoPath: photoPath == null && nullToAbsent
          ? const Value.absent()
          : Value(photoPath),
      reminderIntervalWeeks: Value(reminderIntervalWeeks),
      lastServicedDate: lastServicedDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastServicedDate),
    );
  }

  factory Horse.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Horse(
      id: serializer.fromJson<int>(json['id']),
      ownerId: serializer.fromJson<int?>(json['ownerId']),
      barnId: serializer.fromJson<int?>(json['barnId']),
      name: serializer.fromJson<String>(json['name']),
      notes: serializer.fromJson<String?>(json['notes']),
      photoPath: serializer.fromJson<String?>(json['photoPath']),
      reminderIntervalWeeks:
          serializer.fromJson<int>(json['reminderIntervalWeeks']),
      lastServicedDate:
          serializer.fromJson<DateTime?>(json['lastServicedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ownerId': serializer.toJson<int?>(ownerId),
      'barnId': serializer.toJson<int?>(barnId),
      'name': serializer.toJson<String>(name),
      'notes': serializer.toJson<String?>(notes),
      'photoPath': serializer.toJson<String?>(photoPath),
      'reminderIntervalWeeks': serializer.toJson<int>(reminderIntervalWeeks),
      'lastServicedDate': serializer.toJson<DateTime?>(lastServicedDate),
    };
  }

  Horse copyWith(
          {int? id,
          Value<int?> ownerId = const Value.absent(),
          Value<int?> barnId = const Value.absent(),
          String? name,
          Value<String?> notes = const Value.absent(),
          Value<String?> photoPath = const Value.absent(),
          int? reminderIntervalWeeks,
          Value<DateTime?> lastServicedDate = const Value.absent()}) =>
      Horse(
        id: id ?? this.id,
        ownerId: ownerId.present ? ownerId.value : this.ownerId,
        barnId: barnId.present ? barnId.value : this.barnId,
        name: name ?? this.name,
        notes: notes.present ? notes.value : this.notes,
        photoPath: photoPath.present ? photoPath.value : this.photoPath,
        reminderIntervalWeeks:
            reminderIntervalWeeks ?? this.reminderIntervalWeeks,
        lastServicedDate: lastServicedDate.present
            ? lastServicedDate.value
            : this.lastServicedDate,
      );
  Horse copyWithCompanion(HorsesCompanion data) {
    return Horse(
      id: data.id.present ? data.id.value : this.id,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      barnId: data.barnId.present ? data.barnId.value : this.barnId,
      name: data.name.present ? data.name.value : this.name,
      notes: data.notes.present ? data.notes.value : this.notes,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      reminderIntervalWeeks: data.reminderIntervalWeeks.present
          ? data.reminderIntervalWeeks.value
          : this.reminderIntervalWeeks,
      lastServicedDate: data.lastServicedDate.present
          ? data.lastServicedDate.value
          : this.lastServicedDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Horse(')
          ..write('id: $id, ')
          ..write('ownerId: $ownerId, ')
          ..write('barnId: $barnId, ')
          ..write('name: $name, ')
          ..write('notes: $notes, ')
          ..write('photoPath: $photoPath, ')
          ..write('reminderIntervalWeeks: $reminderIntervalWeeks, ')
          ..write('lastServicedDate: $lastServicedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ownerId, barnId, name, notes, photoPath,
      reminderIntervalWeeks, lastServicedDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Horse &&
          other.id == this.id &&
          other.ownerId == this.ownerId &&
          other.barnId == this.barnId &&
          other.name == this.name &&
          other.notes == this.notes &&
          other.photoPath == this.photoPath &&
          other.reminderIntervalWeeks == this.reminderIntervalWeeks &&
          other.lastServicedDate == this.lastServicedDate);
}

class HorsesCompanion extends UpdateCompanion<Horse> {
  final Value<int> id;
  final Value<int?> ownerId;
  final Value<int?> barnId;
  final Value<String> name;
  final Value<String?> notes;
  final Value<String?> photoPath;
  final Value<int> reminderIntervalWeeks;
  final Value<DateTime?> lastServicedDate;
  const HorsesCompanion({
    this.id = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.barnId = const Value.absent(),
    this.name = const Value.absent(),
    this.notes = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.reminderIntervalWeeks = const Value.absent(),
    this.lastServicedDate = const Value.absent(),
  });
  HorsesCompanion.insert({
    this.id = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.barnId = const Value.absent(),
    required String name,
    this.notes = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.reminderIntervalWeeks = const Value.absent(),
    this.lastServicedDate = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Horse> custom({
    Expression<int>? id,
    Expression<int>? ownerId,
    Expression<int>? barnId,
    Expression<String>? name,
    Expression<String>? notes,
    Expression<String>? photoPath,
    Expression<int>? reminderIntervalWeeks,
    Expression<DateTime>? lastServicedDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerId != null) 'owner_id': ownerId,
      if (barnId != null) 'barn_id': barnId,
      if (name != null) 'name': name,
      if (notes != null) 'notes': notes,
      if (photoPath != null) 'photo_path': photoPath,
      if (reminderIntervalWeeks != null)
        'reminder_interval_weeks': reminderIntervalWeeks,
      if (lastServicedDate != null) 'last_serviced_date': lastServicedDate,
    });
  }

  HorsesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? ownerId,
      Value<int?>? barnId,
      Value<String>? name,
      Value<String?>? notes,
      Value<String?>? photoPath,
      Value<int>? reminderIntervalWeeks,
      Value<DateTime?>? lastServicedDate}) {
    return HorsesCompanion(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      barnId: barnId ?? this.barnId,
      name: name ?? this.name,
      notes: notes ?? this.notes,
      photoPath: photoPath ?? this.photoPath,
      reminderIntervalWeeks:
          reminderIntervalWeeks ?? this.reminderIntervalWeeks,
      lastServicedDate: lastServicedDate ?? this.lastServicedDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<int>(ownerId.value);
    }
    if (barnId.present) {
      map['barn_id'] = Variable<int>(barnId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (reminderIntervalWeeks.present) {
      map['reminder_interval_weeks'] =
          Variable<int>(reminderIntervalWeeks.value);
    }
    if (lastServicedDate.present) {
      map['last_serviced_date'] = Variable<DateTime>(lastServicedDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HorsesCompanion(')
          ..write('id: $id, ')
          ..write('ownerId: $ownerId, ')
          ..write('barnId: $barnId, ')
          ..write('name: $name, ')
          ..write('notes: $notes, ')
          ..write('photoPath: $photoPath, ')
          ..write('reminderIntervalWeeks: $reminderIntervalWeeks, ')
          ..write('lastServicedDate: $lastServicedDate')
          ..write(')'))
        .toString();
  }
}

class $VisitsTable extends Visits with TableInfo<$VisitsTable, Visit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VisitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _horseIdMeta =
      const VerificationMeta('horseId');
  @override
  late final GeneratedColumn<int> horseId = GeneratedColumn<int>(
      'horse_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES horses(id) ON DELETE CASCADE');
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, horseId, date, type, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'visits';
  @override
  VerificationContext validateIntegrity(Insertable<Visit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('horse_id')) {
      context.handle(_horseIdMeta,
          horseId.isAcceptableOrUnknown(data['horse_id']!, _horseIdMeta));
    } else if (isInserting) {
      context.missing(_horseIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Visit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Visit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      horseId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}horse_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $VisitsTable createAlias(String alias) {
    return $VisitsTable(attachedDatabase, alias);
  }
}

class Visit extends DataClass implements Insertable<Visit> {
  final int id;
  final int horseId;
  final DateTime date;
  final String type;
  final String? notes;
  const Visit(
      {required this.id,
      required this.horseId,
      required this.date,
      required this.type,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['horse_id'] = Variable<int>(horseId);
    map['date'] = Variable<DateTime>(date);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  VisitsCompanion toCompanion(bool nullToAbsent) {
    return VisitsCompanion(
      id: Value(id),
      horseId: Value(horseId),
      date: Value(date),
      type: Value(type),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory Visit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Visit(
      id: serializer.fromJson<int>(json['id']),
      horseId: serializer.fromJson<int>(json['horseId']),
      date: serializer.fromJson<DateTime>(json['date']),
      type: serializer.fromJson<String>(json['type']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'horseId': serializer.toJson<int>(horseId),
      'date': serializer.toJson<DateTime>(date),
      'type': serializer.toJson<String>(type),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  Visit copyWith(
          {int? id,
          int? horseId,
          DateTime? date,
          String? type,
          Value<String?> notes = const Value.absent()}) =>
      Visit(
        id: id ?? this.id,
        horseId: horseId ?? this.horseId,
        date: date ?? this.date,
        type: type ?? this.type,
        notes: notes.present ? notes.value : this.notes,
      );
  Visit copyWithCompanion(VisitsCompanion data) {
    return Visit(
      id: data.id.present ? data.id.value : this.id,
      horseId: data.horseId.present ? data.horseId.value : this.horseId,
      date: data.date.present ? data.date.value : this.date,
      type: data.type.present ? data.type.value : this.type,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Visit(')
          ..write('id: $id, ')
          ..write('horseId: $horseId, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, horseId, date, type, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Visit &&
          other.id == this.id &&
          other.horseId == this.horseId &&
          other.date == this.date &&
          other.type == this.type &&
          other.notes == this.notes);
}

class VisitsCompanion extends UpdateCompanion<Visit> {
  final Value<int> id;
  final Value<int> horseId;
  final Value<DateTime> date;
  final Value<String> type;
  final Value<String?> notes;
  const VisitsCompanion({
    this.id = const Value.absent(),
    this.horseId = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.notes = const Value.absent(),
  });
  VisitsCompanion.insert({
    this.id = const Value.absent(),
    required int horseId,
    required DateTime date,
    required String type,
    this.notes = const Value.absent(),
  })  : horseId = Value(horseId),
        date = Value(date),
        type = Value(type);
  static Insertable<Visit> custom({
    Expression<int>? id,
    Expression<int>? horseId,
    Expression<DateTime>? date,
    Expression<String>? type,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (horseId != null) 'horse_id': horseId,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
      if (notes != null) 'notes': notes,
    });
  }

  VisitsCompanion copyWith(
      {Value<int>? id,
      Value<int>? horseId,
      Value<DateTime>? date,
      Value<String>? type,
      Value<String?>? notes}) {
    return VisitsCompanion(
      id: id ?? this.id,
      horseId: horseId ?? this.horseId,
      date: date ?? this.date,
      type: type ?? this.type,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (horseId.present) {
      map['horse_id'] = Variable<int>(horseId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitsCompanion(')
          ..write('id: $id, ')
          ..write('horseId: $horseId, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BarnsTable barns = $BarnsTable(this);
  late final $OwnersTable owners = $OwnersTable(this);
  late final $OwnerBarnsTable ownerBarns = $OwnerBarnsTable(this);
  late final $HorsesTable horses = $HorsesTable(this);
  late final $VisitsTable visits = $VisitsTable(this);
  late final BarnDao barnDao = BarnDao(this as AppDatabase);
  late final OwnerDao ownerDao = OwnerDao(this as AppDatabase);
  late final VisitsDao visitsDao = VisitsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [barns, owners, ownerBarns, horses, visits];
}

typedef $$BarnsTableCreateCompanionBuilder = BarnsCompanion Function({
  Value<int> id,
  Value<int?> ownerId,
  Value<String?> name,
  Value<String?> address,
  Value<String?> photoPath,
  Value<String?> notes,
});
typedef $$BarnsTableUpdateCompanionBuilder = BarnsCompanion Function({
  Value<int> id,
  Value<int?> ownerId,
  Value<String?> name,
  Value<String?> address,
  Value<String?> photoPath,
  Value<String?> notes,
});

class $$BarnsTableFilterComposer extends Composer<_$AppDatabase, $BarnsTable> {
  $$BarnsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get ownerId => $composableBuilder(
      column: $table.ownerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$BarnsTableOrderingComposer
    extends Composer<_$AppDatabase, $BarnsTable> {
  $$BarnsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get ownerId => $composableBuilder(
      column: $table.ownerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$BarnsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BarnsTable> {
  $$BarnsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$BarnsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BarnsTable,
    Barn,
    $$BarnsTableFilterComposer,
    $$BarnsTableOrderingComposer,
    $$BarnsTableAnnotationComposer,
    $$BarnsTableCreateCompanionBuilder,
    $$BarnsTableUpdateCompanionBuilder,
    (Barn, BaseReferences<_$AppDatabase, $BarnsTable, Barn>),
    Barn,
    PrefetchHooks Function()> {
  $$BarnsTableTableManager(_$AppDatabase db, $BarnsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BarnsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BarnsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BarnsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> ownerId = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> photoPath = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              BarnsCompanion(
            id: id,
            ownerId: ownerId,
            name: name,
            address: address,
            photoPath: photoPath,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> ownerId = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> photoPath = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              BarnsCompanion.insert(
            id: id,
            ownerId: ownerId,
            name: name,
            address: address,
            photoPath: photoPath,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BarnsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BarnsTable,
    Barn,
    $$BarnsTableFilterComposer,
    $$BarnsTableOrderingComposer,
    $$BarnsTableAnnotationComposer,
    $$BarnsTableCreateCompanionBuilder,
    $$BarnsTableUpdateCompanionBuilder,
    (Barn, BaseReferences<_$AppDatabase, $BarnsTable, Barn>),
    Barn,
    PrefetchHooks Function()>;
typedef $$OwnersTableCreateCompanionBuilder = OwnersCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> notes,
});
typedef $$OwnersTableUpdateCompanionBuilder = OwnersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> notes,
});

class $$OwnersTableFilterComposer
    extends Composer<_$AppDatabase, $OwnersTable> {
  $$OwnersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$OwnersTableOrderingComposer
    extends Composer<_$AppDatabase, $OwnersTable> {
  $$OwnersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$OwnersTableAnnotationComposer
    extends Composer<_$AppDatabase, $OwnersTable> {
  $$OwnersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$OwnersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OwnersTable,
    Owner,
    $$OwnersTableFilterComposer,
    $$OwnersTableOrderingComposer,
    $$OwnersTableAnnotationComposer,
    $$OwnersTableCreateCompanionBuilder,
    $$OwnersTableUpdateCompanionBuilder,
    (Owner, BaseReferences<_$AppDatabase, $OwnersTable, Owner>),
    Owner,
    PrefetchHooks Function()> {
  $$OwnersTableTableManager(_$AppDatabase db, $OwnersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OwnersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OwnersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OwnersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              OwnersCompanion(
            id: id,
            name: name,
            phone: phone,
            email: email,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              OwnersCompanion.insert(
            id: id,
            name: name,
            phone: phone,
            email: email,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OwnersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OwnersTable,
    Owner,
    $$OwnersTableFilterComposer,
    $$OwnersTableOrderingComposer,
    $$OwnersTableAnnotationComposer,
    $$OwnersTableCreateCompanionBuilder,
    $$OwnersTableUpdateCompanionBuilder,
    (Owner, BaseReferences<_$AppDatabase, $OwnersTable, Owner>),
    Owner,
    PrefetchHooks Function()>;
typedef $$OwnerBarnsTableCreateCompanionBuilder = OwnerBarnsCompanion Function({
  required int ownerId,
  required int barnId,
  Value<int> rowid,
});
typedef $$OwnerBarnsTableUpdateCompanionBuilder = OwnerBarnsCompanion Function({
  Value<int> ownerId,
  Value<int> barnId,
  Value<int> rowid,
});

class $$OwnerBarnsTableFilterComposer
    extends Composer<_$AppDatabase, $OwnerBarnsTable> {
  $$OwnerBarnsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get ownerId => $composableBuilder(
      column: $table.ownerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get barnId => $composableBuilder(
      column: $table.barnId, builder: (column) => ColumnFilters(column));
}

class $$OwnerBarnsTableOrderingComposer
    extends Composer<_$AppDatabase, $OwnerBarnsTable> {
  $$OwnerBarnsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get ownerId => $composableBuilder(
      column: $table.ownerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get barnId => $composableBuilder(
      column: $table.barnId, builder: (column) => ColumnOrderings(column));
}

class $$OwnerBarnsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OwnerBarnsTable> {
  $$OwnerBarnsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<int> get barnId =>
      $composableBuilder(column: $table.barnId, builder: (column) => column);
}

class $$OwnerBarnsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OwnerBarnsTable,
    OwnerBarn,
    $$OwnerBarnsTableFilterComposer,
    $$OwnerBarnsTableOrderingComposer,
    $$OwnerBarnsTableAnnotationComposer,
    $$OwnerBarnsTableCreateCompanionBuilder,
    $$OwnerBarnsTableUpdateCompanionBuilder,
    (OwnerBarn, BaseReferences<_$AppDatabase, $OwnerBarnsTable, OwnerBarn>),
    OwnerBarn,
    PrefetchHooks Function()> {
  $$OwnerBarnsTableTableManager(_$AppDatabase db, $OwnerBarnsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OwnerBarnsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OwnerBarnsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OwnerBarnsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> ownerId = const Value.absent(),
            Value<int> barnId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OwnerBarnsCompanion(
            ownerId: ownerId,
            barnId: barnId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int ownerId,
            required int barnId,
            Value<int> rowid = const Value.absent(),
          }) =>
              OwnerBarnsCompanion.insert(
            ownerId: ownerId,
            barnId: barnId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OwnerBarnsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OwnerBarnsTable,
    OwnerBarn,
    $$OwnerBarnsTableFilterComposer,
    $$OwnerBarnsTableOrderingComposer,
    $$OwnerBarnsTableAnnotationComposer,
    $$OwnerBarnsTableCreateCompanionBuilder,
    $$OwnerBarnsTableUpdateCompanionBuilder,
    (OwnerBarn, BaseReferences<_$AppDatabase, $OwnerBarnsTable, OwnerBarn>),
    OwnerBarn,
    PrefetchHooks Function()>;
typedef $$HorsesTableCreateCompanionBuilder = HorsesCompanion Function({
  Value<int> id,
  Value<int?> ownerId,
  Value<int?> barnId,
  required String name,
  Value<String?> notes,
  Value<String?> photoPath,
  Value<int> reminderIntervalWeeks,
  Value<DateTime?> lastServicedDate,
});
typedef $$HorsesTableUpdateCompanionBuilder = HorsesCompanion Function({
  Value<int> id,
  Value<int?> ownerId,
  Value<int?> barnId,
  Value<String> name,
  Value<String?> notes,
  Value<String?> photoPath,
  Value<int> reminderIntervalWeeks,
  Value<DateTime?> lastServicedDate,
});

class $$HorsesTableFilterComposer
    extends Composer<_$AppDatabase, $HorsesTable> {
  $$HorsesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get ownerId => $composableBuilder(
      column: $table.ownerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get barnId => $composableBuilder(
      column: $table.barnId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reminderIntervalWeeks => $composableBuilder(
      column: $table.reminderIntervalWeeks,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastServicedDate => $composableBuilder(
      column: $table.lastServicedDate,
      builder: (column) => ColumnFilters(column));
}

class $$HorsesTableOrderingComposer
    extends Composer<_$AppDatabase, $HorsesTable> {
  $$HorsesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get ownerId => $composableBuilder(
      column: $table.ownerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get barnId => $composableBuilder(
      column: $table.barnId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get photoPath => $composableBuilder(
      column: $table.photoPath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reminderIntervalWeeks => $composableBuilder(
      column: $table.reminderIntervalWeeks,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastServicedDate => $composableBuilder(
      column: $table.lastServicedDate,
      builder: (column) => ColumnOrderings(column));
}

class $$HorsesTableAnnotationComposer
    extends Composer<_$AppDatabase, $HorsesTable> {
  $$HorsesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<int> get barnId =>
      $composableBuilder(column: $table.barnId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<int> get reminderIntervalWeeks => $composableBuilder(
      column: $table.reminderIntervalWeeks, builder: (column) => column);

  GeneratedColumn<DateTime> get lastServicedDate => $composableBuilder(
      column: $table.lastServicedDate, builder: (column) => column);
}

class $$HorsesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HorsesTable,
    Horse,
    $$HorsesTableFilterComposer,
    $$HorsesTableOrderingComposer,
    $$HorsesTableAnnotationComposer,
    $$HorsesTableCreateCompanionBuilder,
    $$HorsesTableUpdateCompanionBuilder,
    (Horse, BaseReferences<_$AppDatabase, $HorsesTable, Horse>),
    Horse,
    PrefetchHooks Function()> {
  $$HorsesTableTableManager(_$AppDatabase db, $HorsesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HorsesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HorsesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HorsesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> ownerId = const Value.absent(),
            Value<int?> barnId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> photoPath = const Value.absent(),
            Value<int> reminderIntervalWeeks = const Value.absent(),
            Value<DateTime?> lastServicedDate = const Value.absent(),
          }) =>
              HorsesCompanion(
            id: id,
            ownerId: ownerId,
            barnId: barnId,
            name: name,
            notes: notes,
            photoPath: photoPath,
            reminderIntervalWeeks: reminderIntervalWeeks,
            lastServicedDate: lastServicedDate,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int?> ownerId = const Value.absent(),
            Value<int?> barnId = const Value.absent(),
            required String name,
            Value<String?> notes = const Value.absent(),
            Value<String?> photoPath = const Value.absent(),
            Value<int> reminderIntervalWeeks = const Value.absent(),
            Value<DateTime?> lastServicedDate = const Value.absent(),
          }) =>
              HorsesCompanion.insert(
            id: id,
            ownerId: ownerId,
            barnId: barnId,
            name: name,
            notes: notes,
            photoPath: photoPath,
            reminderIntervalWeeks: reminderIntervalWeeks,
            lastServicedDate: lastServicedDate,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HorsesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HorsesTable,
    Horse,
    $$HorsesTableFilterComposer,
    $$HorsesTableOrderingComposer,
    $$HorsesTableAnnotationComposer,
    $$HorsesTableCreateCompanionBuilder,
    $$HorsesTableUpdateCompanionBuilder,
    (Horse, BaseReferences<_$AppDatabase, $HorsesTable, Horse>),
    Horse,
    PrefetchHooks Function()>;
typedef $$VisitsTableCreateCompanionBuilder = VisitsCompanion Function({
  Value<int> id,
  required int horseId,
  required DateTime date,
  required String type,
  Value<String?> notes,
});
typedef $$VisitsTableUpdateCompanionBuilder = VisitsCompanion Function({
  Value<int> id,
  Value<int> horseId,
  Value<DateTime> date,
  Value<String> type,
  Value<String?> notes,
});

class $$VisitsTableFilterComposer
    extends Composer<_$AppDatabase, $VisitsTable> {
  $$VisitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get horseId => $composableBuilder(
      column: $table.horseId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$VisitsTableOrderingComposer
    extends Composer<_$AppDatabase, $VisitsTable> {
  $$VisitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get horseId => $composableBuilder(
      column: $table.horseId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$VisitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VisitsTable> {
  $$VisitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get horseId =>
      $composableBuilder(column: $table.horseId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$VisitsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VisitsTable,
    Visit,
    $$VisitsTableFilterComposer,
    $$VisitsTableOrderingComposer,
    $$VisitsTableAnnotationComposer,
    $$VisitsTableCreateCompanionBuilder,
    $$VisitsTableUpdateCompanionBuilder,
    (Visit, BaseReferences<_$AppDatabase, $VisitsTable, Visit>),
    Visit,
    PrefetchHooks Function()> {
  $$VisitsTableTableManager(_$AppDatabase db, $VisitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VisitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VisitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VisitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> horseId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> notes = const Value.absent(),
          }) =>
              VisitsCompanion(
            id: id,
            horseId: horseId,
            date: date,
            type: type,
            notes: notes,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int horseId,
            required DateTime date,
            required String type,
            Value<String?> notes = const Value.absent(),
          }) =>
              VisitsCompanion.insert(
            id: id,
            horseId: horseId,
            date: date,
            type: type,
            notes: notes,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$VisitsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VisitsTable,
    Visit,
    $$VisitsTableFilterComposer,
    $$VisitsTableOrderingComposer,
    $$VisitsTableAnnotationComposer,
    $$VisitsTableCreateCompanionBuilder,
    $$VisitsTableUpdateCompanionBuilder,
    (Visit, BaseReferences<_$AppDatabase, $VisitsTable, Visit>),
    Visit,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BarnsTableTableManager get barns =>
      $$BarnsTableTableManager(_db, _db.barns);
  $$OwnersTableTableManager get owners =>
      $$OwnersTableTableManager(_db, _db.owners);
  $$OwnerBarnsTableTableManager get ownerBarns =>
      $$OwnerBarnsTableTableManager(_db, _db.ownerBarns);
  $$HorsesTableTableManager get horses =>
      $$HorsesTableTableManager(_db, _db.horses);
  $$VisitsTableTableManager get visits =>
      $$VisitsTableTableManager(_db, _db.visits);
}
