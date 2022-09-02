import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:razor_pay/controller/razor_pay_bloc.dart';
import 'package:razor_pay/resourse/resourse.dart';

/// razor pay work is only done on this page only
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _selectedAnimals2 = [];
  List _selectedAnimals3 = [];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();

  stopTakingSS() async =>
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);

  @override
  void initState() {
    super.initState();
    stopTakingSS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MultiSelectBottomSheetField(
                initialChildSize: 0.4,
                listType: MultiSelectListType.CHIP,
                searchable: true,
                buttonText: const Text("Favorite Animals"),
                title: const Text("Animal"),
                items: _items,
                onConfirm: (values) =>
                    setState(() => _selectedAnimals2 = values),
                chipDisplay: MultiSelectChipDisplay(
                    onTap: (value) =>
                        setState(() => _selectedAnimals2.remove(value))),
              ),
              _selectedAnimals2 == null || _selectedAnimals2.isEmpty
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Pls Select any item",
                        style: TextStyle(color: Colors.black54),
                      ))
                  : Container(),
              const SizedBox(height: 40),
              MultiSelectChipField(
                  items: _items,
                  initialValue: _selectedAnimals3,
                  title: const Text("Animals"),
                  headerColor: Colors.blue.withOpacity(0.5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 1.8)),
                  selectedChipColor: Colors.blue.withOpacity(0.5),
                  selectedTextStyle: TextStyle(color: Colors.blue[800]),
                  onTap: (values) =>
                      setState(() => _selectedAnimals3 = values)),
              MaterialButton(
                  color: Colors.blue,
                  onPressed: () => BlocProvider.of<RazorPayBloc>(context)
                      .add(CallPaymentMethod()),
                  child: const Text("Pay me"))
            ],
          ),
        ),
      ),
    );
  }
}

List<Animal> _animals = [
  Animal(id: 1, name: "Lion"),
  Animal(id: 2, name: "Flamingo"),
  Animal(id: 3, name: "Hippo"),
  Animal(id: 4, name: "Horse"),
  Animal(id: 5, name: "Tiger"),
  Animal(id: 6, name: "Penguin"),
  Animal(id: 7, name: "Spider"),
  Animal(id: 8, name: "Snake"),
  Animal(id: 9, name: "Bear"),
  Animal(id: 10, name: "Beaver"),
  Animal(id: 11, name: "Cat"),
  Animal(id: 12, name: "Fish"),
  Animal(id: 13, name: "Rabbit"),
  Animal(id: 14, name: "Mouse"),
  Animal(id: 15, name: "Dog"),
  Animal(id: 16, name: "Zebra"),
  Animal(id: 17, name: "Cow"),
  Animal(id: 18, name: "Frog"),
  Animal(id: 19, name: "Blue Jay"),
  Animal(id: 20, name: "Moose"),
  Animal(id: 21, name: "Gecko"),
  Animal(id: 22, name: "Kangaroo"),
  Animal(id: 23, name: "Shark"),
  Animal(id: 24, name: "Crocodile"),
  Animal(id: 25, name: "Owl"),
  Animal(id: 26, name: "Dragonfly"),
  Animal(id: 27, name: "Dolphin")
];
