import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String image;
  final int id;

  const BannerEntity({required this.image, required this.id});

  @override
  List<Object?> get props => [
        image,
        id,
      ];
}
