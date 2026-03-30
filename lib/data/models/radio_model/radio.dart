import 'package:json_annotation/json_annotation.dart';

part 'radio.g.dart';

@JsonSerializable()
class RadioItem {
	final int? id;
	final String? name;
	final String? url;
	@JsonKey(name: 'recent_date') 
	final String? recentDate;

	const RadioItem({this.id, this.name, this.url, this.recentDate});

	@override
	String toString() {
		return 'Radio(id: $id, name: $name, url: $url, recentDate: $recentDate)';
	}

	factory RadioItem.fromJson(Map<String, dynamic> json) => _$RadioItemFromJson(json);

	Map<String, dynamic> toJson() => _$RadioItemToJson(this);

	RadioItem copyWith({
		int? id,
		String? name,
		String? url,
		String? recentDate,
	}) {
		return RadioItem(
			id: id ?? this.id,
			name: name ?? this.name,
			url: url ?? this.url,
			recentDate: recentDate ?? this.recentDate,
		);
	}
}
