import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'gregorian.dart';
import 'hijri.dart';

part 'date.g.dart';

@JsonSerializable()
class Date {
	final String? readable;
	final String? timestamp;
	final Hijri? hijri;
	final Gregorian? gregorian;

	const Date({this.readable, this.timestamp, this.hijri, this.gregorian});

	@override
	String toString() {
		return 'Date(readable: $readable, timestamp: $timestamp, hijri: $hijri, gregorian: $gregorian)';
	}

	factory Date.fromJson(Map<String, dynamic> json) => _$DateFromJson(json);

	Map<String, dynamic> toJson() => _$DateToJson(this);

	Date copyWith({
		String? readable,
		String? timestamp,
		Hijri? hijri,
		Gregorian? gregorian,
	}) {
		return Date(
			readable: readable ?? this.readable,
			timestamp: timestamp ?? this.timestamp,
			hijri: hijri ?? this.hijri,
			gregorian: gregorian ?? this.gregorian,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Date) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			readable.hashCode ^
			timestamp.hashCode ^
			hijri.hashCode ^
			gregorian.hashCode;
}
