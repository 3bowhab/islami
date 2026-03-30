import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'method.dart';
import 'offset.dart';

part 'meta.g.dart';

@JsonSerializable()
class Meta {
	final double? latitude;
	final double? longitude;
	final String? timezone;
	final Method? method;
	final String? latitudeAdjustmentMethod;
	final String? midnightMode;
	final String? school;
	final Offset? offset;

	const Meta({
		this.latitude, 
		this.longitude, 
		this.timezone, 
		this.method, 
		this.latitudeAdjustmentMethod, 
		this.midnightMode, 
		this.school, 
		this.offset, 
	});

	@override
	String toString() {
		return 'Meta(latitude: $latitude, longitude: $longitude, timezone: $timezone, method: $method, latitudeAdjustmentMethod: $latitudeAdjustmentMethod, midnightMode: $midnightMode, school: $school, offset: $offset)';
	}

	factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

	Map<String, dynamic> toJson() => _$MetaToJson(this);

	Meta copyWith({
		double? latitude,
		double? longitude,
		String? timezone,
		Method? method,
		String? latitudeAdjustmentMethod,
		String? midnightMode,
		String? school,
		Offset? offset,
	}) {
		return Meta(
			latitude: latitude ?? this.latitude,
			longitude: longitude ?? this.longitude,
			timezone: timezone ?? this.timezone,
			method: method ?? this.method,
			latitudeAdjustmentMethod: latitudeAdjustmentMethod ?? this.latitudeAdjustmentMethod,
			midnightMode: midnightMode ?? this.midnightMode,
			school: school ?? this.school,
			offset: offset ?? this.offset,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Meta) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			latitude.hashCode ^
			longitude.hashCode ^
			timezone.hashCode ^
			method.hashCode ^
			latitudeAdjustmentMethod.hashCode ^
			midnightMode.hashCode ^
			school.hashCode ^
			offset.hashCode;
}
