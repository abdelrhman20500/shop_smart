import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String title;
  final String image;

  const CategoryEntity(
      {required this.id, required this.title, required this.image});

  @override
  List<Object?> get props => [id, title, image];
}
