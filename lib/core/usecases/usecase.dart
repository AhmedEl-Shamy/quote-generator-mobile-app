abstract class UseCase <RType> {
  RType call ();
}
abstract class UseCaseWithParam <RType, PType> {
  RType call (PType param);
}