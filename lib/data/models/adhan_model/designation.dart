import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'designation.g.dart';

@JsonSerializable()
class Designation {
	final String? abbreviated;
	final String? expanded;

	const Designation({this.abbreviated, this.expanded});

	@override
	String toString() {
		return 'Designation(abbreviated: $abbreviated, expanded: $expanded)';
	}

	factory Designation.fromJson(Map<String, dynamic> json) {
		return _$DesignationFromJson(json);
	}

	Map<String, dynamic> toJson() => _$DesignationToJson(this);

	Designation copyWith({
		String? abbreviated,
		String? expanded,
	}) {
		return Designation(
			abbreviated: abbreviated ?? this.abbreviated,
			expanded: expanded ?? this.expanded,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Designation) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode => abbreviated.hashCode ^ expanded.hashCode;
}
