import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ModularState', (tester) async {
    final modularApp = ModularApp(module: CustomModule(), child: AppWidget());
    await tester.pumpWidget(modularApp);

    await tester.pump();
    final finder = find.byKey(key);
    expect(finder, findsOneWidget);
  });
}

final key = UniqueKey();

class CustomModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => 'test'),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => HomeExample(key: key)),
      ];
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp().modular();
  }
}

class HomeExample extends StatefulWidget {
  const HomeExample({Key? key}) : super(key: key);

  @override
  _HomeExampleState createState() => _HomeExampleState();
}

class _HomeExampleState extends ModularState<HomeExample, String> {
  @override
  Widget build(BuildContext context) {
    print(cubit);
    print(bloc);
    print(store);
    print(controller);
    return Container();
  }
}
