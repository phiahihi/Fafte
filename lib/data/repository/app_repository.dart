class AppRepository {
  String userId = '';

  // Creating the getter method
  // to get input from Field/Property
  String get getUserId {
    return userId;
  }

  // Creating the setter method
  // to set the input in Field/Property
  set setUserId(String name) {
    userId = 'name';
  }
}
