import 'movie_details_model.dart';

class MoviesModel {
  MoviesModel({
    required this.averageRating,
    required this.backdropPath,
    required this.description,
    required this.id,
    required this.iso_3166_1,
    required this.iso_639_1,
    required this.name,
    required this.page,
    required this.posterPath,
    required this.public,
    required this.movieList,
    required this.revenue,
    required this.runtime,
    required this.sortBy,
    required this.totalPages,
    required this.totalResults,
  });
  late final double averageRating;
  late final String backdropPath;
  late final String description;
  late final int id;
  late final String iso_3166_1;
  late final String iso_639_1;
  late final String name;
  late final int page;
  late final String posterPath;
  late final bool public;
  late final List<MovieDetailsModel> movieList;
  late final int revenue;
  late final int runtime;
  late final String sortBy;
  late final int totalPages;
  late final int totalResults;

  MoviesModel.fromJson(Map<String, dynamic> json) {
    averageRating = json['average_rating'];
    backdropPath = json['backdrop_path'];
    description = json['description'];
    id = json['id'];
    iso_3166_1 = json['iso_3166_1'];
    iso_639_1 = json['iso_639_1'];
    name = json['name'];
    page = json['page'];
    posterPath = json['poster_path'];
    public = json['public'];
    movieList = List.from(json['results']).map((e) => MovieDetailsModel.fromJson(e)).toList();
    revenue = json['revenue'];
    runtime = json['runtime'];
    sortBy = json['sort_by'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['average_rating'] = averageRating;
    data['backdrop_path'] = backdropPath;
    data['description'] = description;
    data['id'] = id;
    data['iso_3166_1'] = iso_3166_1;
    data['iso_639_1'] = iso_639_1;
    data['name'] = name;
    data['page'] = page;
    data['poster_path'] = posterPath;
    data['public'] = public;
    data['results'] = movieList.map((e) => e.toJson()).toList();
    data['revenue'] = revenue;
    data['runtime'] = runtime;
    data['sort_by'] = sortBy;
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }

  @override
  String toString() {
    return 'MoviesModel(averageRating: $averageRating, backdropPath: $backdropPath, description: $description, id: $id, iso_3166_1: $iso_3166_1, iso_639_1: $iso_639_1, name: $name, page: $page, posterPath: $posterPath, public: $public, movieList: $movieList, revenue: $revenue, runtime: $runtime, sortBy: $sortBy, totalPages: $totalPages, totalResults: $totalResults)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoviesModel &&
        other.averageRating == averageRating &&
        other.backdropPath == backdropPath &&
        other.description == description &&
        other.id == id &&
        other.iso_3166_1 == iso_3166_1 &&
        other.iso_639_1 == iso_639_1 &&
        other.name == name &&
        other.page == page &&
        other.posterPath == posterPath &&
        other.public == public &&
        other.movieList == movieList &&
        other.revenue == revenue &&
        other.runtime == runtime &&
        other.sortBy == sortBy &&
        other.totalPages == totalPages &&
        other.totalResults == totalResults;
  }

  @override
  int get hashCode {
    return averageRating.hashCode ^
        backdropPath.hashCode ^
        description.hashCode ^
        id.hashCode ^
        iso_3166_1.hashCode ^
        iso_639_1.hashCode ^
        name.hashCode ^
        page.hashCode ^
        posterPath.hashCode ^
        public.hashCode ^
        movieList.hashCode ^
        revenue.hashCode ^
        runtime.hashCode ^
        sortBy.hashCode ^
        totalPages.hashCode ^
        totalResults.hashCode;
  }

  MoviesModel copyWith({
    double? averageRating,
    String? backdropPath,
    String? description,
    int? id,
    String? iso_3166_1,
    String? iso_639_1,
    String? name,
    int? page,
    String? posterPath,
    bool? public,
    List<MovieDetailsModel>? movieList,
    int? revenue,
    int? runtime,
    String? sortBy,
    int? totalPages,
    int? totalResults,
  }) {
    return MoviesModel(
      averageRating: averageRating ?? this.averageRating,
      backdropPath: backdropPath ?? this.backdropPath,
      description: description ?? this.description,
      id: id ?? this.id,
      iso_3166_1: iso_3166_1 ?? this.iso_3166_1,
      iso_639_1: iso_639_1 ?? this.iso_639_1,
      name: name ?? this.name,
      page: page ?? this.page,
      posterPath: posterPath ?? this.posterPath,
      public: public ?? this.public,
      movieList: movieList ?? this.movieList,
      revenue: revenue ?? this.revenue,
      runtime: runtime ?? this.runtime,
      sortBy: sortBy ?? this.sortBy,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}
