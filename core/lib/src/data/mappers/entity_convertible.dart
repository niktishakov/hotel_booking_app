abstract class EntityConvertible<T, E> {
  E toEntity();
  Never fromEntity(E model) => throw UnimplementedError();
}
