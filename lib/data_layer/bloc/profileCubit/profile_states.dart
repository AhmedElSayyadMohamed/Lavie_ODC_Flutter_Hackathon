abstract class ProfileStates{}

class InitialState extends ProfileStates{}
class ChangeState extends ProfileStates{}


class GetUserDataLoadingState extends ProfileStates{}
class GetUserDataSuccessState extends ProfileStates{}
class GetUserDataErrorState extends ProfileStates{}

class EditUserDataLoadingState extends ProfileStates{}
class EditUserDataSuccessState extends ProfileStates{}
class EditUserDataErrorState extends ProfileStates{}


class PickImageLoadingState extends ProfileStates{}
class PickImageSuccessState extends ProfileStates{}
class PickImageErrorState extends ProfileStates{}

class UploadPostLoadingState extends ProfileStates{}
class UploadPostSuccessState extends ProfileStates{}
class UploadPostErrorState extends ProfileStates{}

class ChangeIsAllForumState extends ProfileStates{}
class ChangeAddLikeState extends ProfileStates{}

class GetMyPostLoadingState extends ProfileStates{}
class GetMyPostSuccessState extends ProfileStates{}
class GetMyPostErrorState extends ProfileStates{}


class AddLikeLoadingState extends ProfileStates{}
class AddLikeSuccessState extends ProfileStates{}
class AddLikeErrorState extends ProfileStates{}