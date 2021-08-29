import 'package:flutter/material.dart';
import 'package:shake_ball_magic/components/custom_iconbutton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _sharedPreferences = SharedPreferences.getInstance();

  _checkIfAlertHasViewed() async {
    final alertHasViewed = (await _sharedPreferences).getBool('hasViewed');
    if (alertHasViewed == null || alertHasViewed == false) _showAlert();
  }

  Future<void> _setHasViewed() async {
    (await _sharedPreferences).setBool('hasViewed', true);
  }

  Future<void> _showAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'We are not responsible for the misuse of the features offered by this app.',
                ),
                SizedBox(height: 16),
                Text('Use the shake function with caution.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Agree'),
              onPressed: () async {
                await _setHasViewed();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _checkIfAlertHasViewed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        centerTitle: true,
        title: Text('Ask Me Anything!'),
        actions: [
          const CustomIconButton(
            tooltip: 'Shake your phone or tap on magic ball!',
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
    );
  }
}
