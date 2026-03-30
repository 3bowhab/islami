import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
	final double? latitude;
	final double? longitude;

	const Location({this.latitude, this.longitude});

	@override
	String toString() {
		return 'Location(latitude: $latitude, longitude: $longitude)';
	}

	factory Location.fromJson(Map<String, dynamic> json) {
		return _$LocationFromJson(json);
	}

	Map<String, dynamic> toJson() => _$LocationToJson(this);

	Location copyWith({
		double? latitude,
		double? longitude,
	}) {
		return Location(
			latitude: latitude ?? this.latitude,
			longitude: longitude ?? this.longitude,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Location) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
