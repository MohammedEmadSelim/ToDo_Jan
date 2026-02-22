abstract class BaseAuthRepo{
  Future<String> createUser(String email , String password);
}