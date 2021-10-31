class HouseEntity {
  final String name;
  final String address;

  HouseEntity({
    required this.name,
    required this.address,
  });

  factory HouseEntity.fromSheets(List<String> input) =>
      HouseEntity(name: input[0], address: input[1]);
}
