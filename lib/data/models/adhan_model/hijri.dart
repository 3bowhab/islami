import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'designation.dart';
import 'month.dart';
import 'weekday.dart';

part 'hijri.g.dart';

@JsonSerializable()
class Hijri {
	final String? date;
	final String? format;
	final String? day;
	final Weekday? weekday;
	final Month? month;
	final String? year;
	final Designation? designation;
	final List<dynamic>? holidays;
	final List<dynamic>? adjustedHolidays;
	final String? method;

	const Hijri({
		this.date, 
		this.format, 
		this.day, 
		this.weekday, 
		this.month, 
		this.year, 
		this.designation, 
		this.holidays, 
		this.adjustedHolidays, 
		this.method, 
	});

	@override
	String toString() {
		return 'Hijri(date: $date, format: $format, day: $day, weekday: $weekday, month: $month, year: $year, designation: $designation, holidays: $holidays, adjustedHolidays: $adjustedHolidays, method: $method)';
	}

	factory Hijri.fromJson(Map<String, dynamic> json) => _$HijriFromJson(json);

	Map<String, dynamic> toJson() => _$HijriToJson(this);

	Hijri copyWith({
		String? date,
		String? format,
		String? day,
		Weekday? weekday,
		Month? month,
		String? year,
		Designation? designation,
		List<dynamic>? holidays,
		List<dynamic>? adjustedHolidays,
		String? method,
	}) {
		return Hijri(
			date: date ?? this.date,
			format: format ?? this.format,
			day: day ?? this.day,
			weekday: weekday ?? this.weekday,
			month: month ?? this.month,
			year: year ?? this.year,
			designation: designation ?? this.designation,
			holidays: holidays ?? this.holidays,
			adjustedHolidays: adjustedHolidays ?? this.adjustedHolidays,
			method: method ?? this.method,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Hijri) return false;
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
			holidays.hashCode ^
			adjustedHolidays.hashCode ^
			method.hashCode;
}
