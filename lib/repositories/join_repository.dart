abstract interface class JoinRepository {
  Future<void> join(String username, String password);
  Future<bool> duplicatedCheck(String username);
}