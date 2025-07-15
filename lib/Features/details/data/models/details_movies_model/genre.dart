import 'package:movies/Features/details/domain/entities/genre_entity.dart';

class Genre extends GenreEntity {
	int? id;
	String? name;

	Genre({this.id, this.name}) : super(genreId: id ?? 0, genreName: name ?? 'N/A');

	factory Genre.fromJson(Map<String, dynamic> json) => Genre(
				id: json['id'] as int?,
				name: json['name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
			};
}
