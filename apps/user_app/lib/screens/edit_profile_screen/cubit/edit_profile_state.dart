part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class AdsImageState extends EditProfileState {
  final File? image;
  AdsImageState({required this.image});
}