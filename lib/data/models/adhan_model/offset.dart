import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offset.g.dart';

@JsonSerializable()
class Offset {
	@JsonKey(name: 'Imsak') 
	final int? imsak;
	@JsonKey(name: 'Fajr') 
	final int? fajr;
	@JsonKey(name: 'Sunrise') 
	final int? sunrise;
	@JsonKey(name: 'Dhuhr') 
	final int? dhuhr;
	@JsonKey(name: 'Asr') 
	final int? asr;
	@JsonKey(name: 'Maghrib') 
	final int? maghrib;
	@JsonKey(name: 'Sunset') 
	final int? sunset;
	@JsonKey(name: 'Isha') 
	final int? isha;
	@JsonKey(name: 'Midnight') 
	final int? midnight;

	const Offset({
		this.imsak, 
		this.fajr, 
		this.sunrise, 
		this.dhuhr, 
		this.asr, 
		this.maghrib, 
		this.sunset, 
		this.isha, 
		this.midnight, 
	});

	@override
	String toString() {
		return 'Offset(imsak: $imsak, fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, maghrib: $maghrib, sunset: $sunset, isha: $isha, midnight: $midnight)';
	}

	factory Offset.fromJson(Map<String, dynamic> json) {
		return _$OffsetFromJson(json);
	}

	Map<String, dynamic> toJson() => _$OffsetToJson(this);

	Offset copyWith({
		int? imsak,
		int? fajr,
		int? sunrise,
		int? dhuhr,
		int? asr,
		int? maghrib,
		int? sunset,
		int? isha,
		int? midnight,
	}) {
		return Offset(
			imsak: imsak ?? this.imsak,
			fajr: fajr ?? this.fajr,
			sunrise: sunrise ?? this.sunrise,
			dhuhr: dhuhr ?? this.dhuhr,
			asr: asr ?? this.asr,
			maghrib: maghrib ?? this.maghrib,
			sunset: sunset ?? this.sunset,
			isha: isha ?? this.isha,
			midnight: midnight ?? this.midnight,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Offset) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			imsak.hashCode ^
			fajr.hashCode ^
			sunrise.hashCode ^
			dhuhr.hashCode ^
			asr.hashCode ^
			maghrib.hashCode ^
			sunset.hashCode ^
			isha.hashCode ^
			midnight.hashCode;
}
