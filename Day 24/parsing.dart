import 'dart:convert';

void main() {
  final jsonData = """
  {
  "data": [
    {
      "id": 7,
      "email": "michael.lawson@reqres.in",
      "first_name": "Michael",
      "last_name": "Lawson"
    },
    {
      "id": 8,
      "email": "lindsay.ferguson@reqres.in",
      "first_name": "Lindsay",
      "last_name": "Ferguson"
    },
    {
      "id": 9,
      "email": "tobias.funke@reqres.in",
      "first_name": "Tobias",
      "last_name": "Funke"
    }
  ]
}

""";

  print(json.runtimeType);
  final dataDecode = jsonDecode(jsonData);
  final first = dataDecode['data'][0];
  print(first);
}
