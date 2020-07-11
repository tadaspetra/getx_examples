import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    // It is not mandatory to use named routes, but dynamic urls are interesting.
    initialRoute: '/home',
    defaultTransition: Transition.native,
    translations: MyTranslations(),
    locale: Locale('pt', 'BR'),
    getPages: [
      //Simple GetPage
      GetPage(name: '/home', page: () => First()),
      // GetPage with custom transitions and bindings
      GetPage(
        name: '/second',
        page: () => Second(),
        binding: SampleBind(),
      ),
    ],
  ));
}

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'title': 'Hello World %s',
        },
        'en_US': {
          'title': 'Hello World from US',
        },
        'pt': {
          'title': 'Olá de Portugal',
        },
        'pt_BR': {
          'title': 'Olá do Brasil',
        },
      };
}

class First extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title".trArgs(['John'])),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                controller: emailController,
              ),
            ),
            RaisedButton(
              child: Text("Validate Email"),
              onPressed: () {
                if (GetUtils.isEmail(emailController.text)) {
                  Get.snackbar(
                    "Email Correct",
                    "Good Email Format",
                    backgroundColor: Colors.green,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  Get.snackbar(
                    "Email Incorrect",
                    "Bad Email Format",
                    backgroundColor: Colors.red,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text('Change locale to English'),
              onPressed: () {
                Get.updateLocale(Locale('en', 'UK'));
              },
            ),
            RaisedButton(
              child: Text('Change locale to US'),
              onPressed: () {
                Get.updateLocale(Locale('en', 'US'));
              },
            ),
            RaisedButton(
              child: Text('Change locale to Portugal'),
              onPressed: () {
                Get.updateLocale(Locale('pt', 'PT'));
              },
            ),
            RaisedButton(
              child: Text('Change locale to Brazil'),
              onPressed: () {
                Get.updateLocale(Locale('pt', 'BR'));
              },
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text('Next Route'),
              onPressed: () {
                Get.toNamed('/second');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<SumController>(
              //You can use bindings instead of init. Bindings are when this widget gets
              //rendered, you can create your Controller
              builder: (_) {
                print("count1 rebuild");
                return Text(
                  'Counter #1:    ${_.count1.value}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            Text("                        +"),
            GetX<SumController>(
              builder: (_) {
                print("count2 rebuild");
                return Text(
                  'Counter #2:    ${_.count2.value}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
            Text("                        ="),
            GetX<SumController>(builder: (_) {
              print("sum rebuild");
              return Text(
                'Sum:                 ${_.sum}',
                style: TextStyle(fontWeight: FontWeight.bold),
              );
            }),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text("Increment Counter #1"),
              onPressed: () {
                Get.find<SumController>().increment();
              },
            ),
            RaisedButton(
              child: Text("Increment Counter #2"),
              onPressed: () {
                Get.find<SumController>().increment2();
              },
            ),
            RaisedButton(
              child: Text("Store Values"),
              onPressed: () {
                GetStorage box = GetStorage();
                box.write("count1", Get.find<SumController>().count1.value);
                box.write("count2", Get.find<SumController>().count2.value);
              },
            ),
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text("Change Theme"),
              onPressed: () {
                if (Get.isDarkMode) {
                  Get.changeTheme(ThemeData.light());
                } else {
                  Get.changeTheme(ThemeData.dark());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SumController>(() => SumController());
  }
}

class SumController extends GetxController {
  final count1 = 0.obs;
  final count2 = 0.obs;

  @override
  onInit() {
    GetStorage box = GetStorage();
    if (box.read("count1") != null) {
      count1.value = box.read("count1");
      count2.value = box.read("count2");
    }
  }

  int get sum => count1.value + count2.value;

  increment() => count1.value++;

  increment2() => count2.value++;
}

class SizeTransitions extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve curve,
      Alignment alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return Align(
      alignment: Alignment.center,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animation,
          curve: curve,
        ),
        child: child,
      ),
    );
  }
}
