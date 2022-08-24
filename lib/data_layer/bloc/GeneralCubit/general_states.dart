abstract class GeneralLavieStates{}

class InitialState extends GeneralLavieStates{}

class ChangeBottomNavIndexState extends GeneralLavieStates{}
class ChangeCategoryIndexState extends GeneralLavieStates{}

class ChangeProductWhichGoToCardIndexState extends GeneralLavieStates{}

class ChangeIsAllForumState extends GeneralLavieStates{}

class UpdateUserDataState extends GeneralLavieStates{}

class GetUserDataLoadingState extends GeneralLavieStates{}
class GetUserDataSuccessState extends GeneralLavieStates{}
class GetUserDataErrorState extends GeneralLavieStates{}

class EditUserDataLoadingState extends GeneralLavieStates{}
class EditUserDataSuccessState extends GeneralLavieStates{}
class EditUserDataErrorState extends GeneralLavieStates{}

class GetAllBlogsLoadingState extends GeneralLavieStates{}
class GetAllBlogsSuccessState extends GeneralLavieStates{}
class GetAllBlogsErrorState extends GeneralLavieStates{}

class GetProductsLoadingState extends GeneralLavieStates{}
class GetProductsSuccessState extends GeneralLavieStates{}
class GetProductsErrorState extends GeneralLavieStates{}


class IncrementQuantityOfProduct extends GeneralLavieStates{}
class DecrementQuantityOfProduct extends GeneralLavieStates{}

class CreateProductsDatabaseState extends GeneralLavieStates{}

class AddProductToDatabaseLoadingState extends GeneralLavieStates{}
class AddProductToDatabaseSuccessfullyState extends GeneralLavieStates{}
class AddProductToDatabaseErrorState extends GeneralLavieStates{}

class GetProductDatabaseLoadingState extends GeneralLavieStates{}
class GetProductDatabaseSuccessfullyState extends GeneralLavieStates{}
class GetProductDatabaseErrorState extends GeneralLavieStates{}
class DeleteProductFromDatabaseState extends GeneralLavieStates{}
