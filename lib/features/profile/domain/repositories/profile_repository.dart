import 'dart:io';

import 'package:food_hub/features/profile/domain/entities/profile.dart';

import '../../data/models/update_profile_request.dart';

abstract class ProfileRepository {
  Future<Profile> getProfile();
  Future<bool> updateProfile(UpdateProfileRequest request);
  Future<bool> updateProfileImage(File file);
}
