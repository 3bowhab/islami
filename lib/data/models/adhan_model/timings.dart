import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'timings.g.dart';

@JsonSerializable()
class Timings {
	@JsonKey(name: 'Fajr') 
	final String? fajr;
	@JsonKey(name: 'Sunrise') 
	final String? sunrise;
	@JsonKey(name: 'Dhuhr') 
	final String? dhuhr;
	@JsonKey(name: 'Asr') 
	final String? asr;
	@JsonKey(name: 'Sunset') 
	final String? sunset;
	@JsonKey(name: 'Maghrib') 
	final String? maghrib;
	@JsonKey(name: 'Isha') 
	final String? isha;
	@JsonKey(name: 'Imsak') 
	final String? imsak;
	@JsonKey(name: 'Midnight') 
	final String? midnight;
	@JsonKey(name: 'Firstthird') 
	final String? firstthird;
	@JsonKey(name: 'Lastthird') 
	final String? lastthird;

	const Timings({
		this.fajr, 
		this.sunrise, 
		this.dhuhr, 
		this.asr, 
		this.sunset, 
		this.maghrib, 
		this.isha, 
		this.imsak, 
		this.midnight, 
		this.firstthird, 
		this.lastthird, 
	});

	@override
	String toString() {
		return 'Timings(fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, sunset: $sunset, maghrib: $maghrib, isha: $isha, imsak: $imsak, midnight: $midnight, firstthird: $firstthird, lastthird: $lastthird)';
	}

	factory Timings.fromJson(Map<String, dynamic> json) {
		return _$TimingsFromJson(json);
	}

	Map<String, dynamic> toJson() => _$TimingsToJson(this);

	Timings copyWith({
		String? fajr,
		String? sunrise,
		String? dhuhr,
		String? asr,
		String? sunset,
		String? maghrib,
		String? isha,
		String? imsak,
		String? midnight,
		String? firstthird,
		String? lastthird,
	}) {
		return Timings(
			fajr: fajr ?? this.fajr,
			sunrise: sunrise ?? this.sunrise,
			dhuhr: dhuhr ?? this.dhuhr,
			asr: asr ?? this.asr,
			sunset: sunset ?? this.sunset,
			maghrib: maghrib ?? this.maghrib,
			isha: isha ?? this.isha,
			imsak: imsak ?? this.imsak,
			midnight: midnight ?? this.midnight,
			firstthird: firstthird ?? this.firstthird,
			lastthird: lastthird ?? this.lastthird,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Timings) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			fajr.hashCode ^
			sunrise.hashCode ^
			dhuhr.hashCode ^
			asr.hashCode ^
			sunset.hashCode ^
			maghrib.hashCode ^
			isha.hashCode ^
			imsak.hashCode ^
			midnight.hashCode ^
			firstthird.hashCode ^
			lastthird.hashCode;
}
