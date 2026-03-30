import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weekday.g.dart';

@JsonSerializable()
class Weekday {
	final String? en;
	final String? ar;

	const Weekday({this.en, this.ar});

	@override
	String toString() => 'Weekday(en: $en, ar: $ar)';

	factory Weekday.fromJson(Map<String, dynamic> json) {
		return _$WeekdayFromJson(json);
	}

	Map<String, dynamic> toJson() => _$WeekdayToJson(this);

	Weekday copyWith({
		String? en,
		String? ar,
	}) {
		return Weekday(
			en: en ?? this.en,
			ar: ar ?? this.ar,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Weekday) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => en.hashCode ^ ar.hashCode;
}
