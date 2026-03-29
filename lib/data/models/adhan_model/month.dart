import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'month.g.dart';

@JsonSerializable()
class Month {
	final int? number;
	final String? en;
	final String? ar;
	final int? days;

	const Month({this.number, this.en, this.ar, this.days});

	@override
	String toString() {
		return 'Month(number: $number, en: $en, ar: $ar, days: $days)';
	}

	factory Month.fromJson(Map<String, dynamic> json) => _$MonthFromJson(json);

	Map<String, dynamic> toJson() => _$MonthToJson(this);

	Month copyWith({
		int? number,
		String? en,
		String? ar,
		int? days,
	}) {
		return Month(
			number: number ?? this.number,
			en: en ?? this.en,
			ar: ar ?? this.ar,
			days: days ?? this.days,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Month) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			number.hashCode ^
			en.hashCode ^
			ar.hashCode ^
			days.hashCode;
}
