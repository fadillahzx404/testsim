import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Users {
  getUsers() async {
    var result = await http.get(
      Uri.parse('http://localhost/testsim/users_api.php'),
    );
    print(result.statusCode);
    print(result.body);
  }
}
