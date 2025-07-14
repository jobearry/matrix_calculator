abstract class IMatrix{
  String get name;
  int get row;
  int get col;
  List<List<num>> get data;
}

class Matrix implements IMatrix{
  @override
  final String name;

  @override
  final int row;

  @override
  final int col;

  @override
  final List<List<num>> data;

  Matrix({
    required this.name, required this.row, required this.col, required this.data
  });
}




