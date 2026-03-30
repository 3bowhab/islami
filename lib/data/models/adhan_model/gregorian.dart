import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'designation.dart';
import 'month.dart';
import 'weekday.dart';

part 'gregorian.g.dart';

@JsonSerializable()
class Gregorian {
	final String? date;
	final String? format;
	final String? day;
	final Weekday? weekday;
	final Month? month;
	final String? year;
	final Designation? designation;
	final bool? lunarSighting;

	const Gregorian({
		this.date, 
		this.format, 
		this.day, 
		this.weekday, 
		this.month, 
		this.year, 
		this.designation, 
		this.lunarSighting, 
	});

	@override
	String toString() {
		return 'Gregorian(date: $date, format: $format, day: $day, weekday: $weekday, month: $month, year: $year, designation: $designation, lunarSighting: $lunarSighting)';
	}

	factory Gregorian.fromJson(Map<String, dynamic> json) {
		return _$GregorianFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GregorianToJson(this);

	Gregorian copyWith({
		String? date,
		String? format,
		String? day,
		Weekday? weekday,
		Month? month,
		String? year,
		Designation? designation,
		bool? lunarSighting,
	}) {
		return Gregorian(
			date: date ?? this.date,
			format: format ?? this.format,
			day: day ?? this.day,
			weekday: weekday ?? this.weekday,
			month: month ?? this.month,
			year: year ?? this.year,
			designation: designation ?? this.designation,
			lunarSighting: lunarSighting ?? this.lunarSighting,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Gregorian) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			date.hashCode ^
			format.hashCode ^
			day.hashCode ^
			weekday.hashCode ^
			month.hashCode ^
			year.hashCode ^
			designation.hashCode ^
			lunarSighting.hashCode;
}
