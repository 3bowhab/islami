import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'params.g.dart';

@JsonSerializable()
class Params {
	@JsonKey(name: 'Fajr') 
	final int? fajr;
	@JsonKey(name: 'Isha') 
	final int? isha;

	const Params({this.fajr, this.isha});

	@override
	String toString() => 'Params(fajr: $fajr, isha: $isha)';

	factory Params.fromJson(Map<String, dynamic> json) {
		return _$ParamsFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ParamsToJson(this);

	Params copyWith({
		int? fajr,
		int? isha,
	}) {
		return Params(
			fajr: fajr ?? this.fajr,
			isha: isha ?? this.isha,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Params) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => fajr.hashCode ^ isha.hashCode;
}
