// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.



import 'package:flutter/material.dart';
import 'package:flutter_packages/packages/hive/hive_box.dart';
import 'package:flutter_packages/packages/hive/model/amount.dart';
import 'package:hive_flutter/hive_flutter.dart';


class AmountPage extends StatefulWidget {
  const AmountPage({super.key});

  @override
  State<AmountPage> createState() => _AmountPageState();
}

class _AmountPageState extends State<AmountPage> {

  final textController = TextEditingController();
  final amountController = TextEditingController();

  var isPlus;

  @override
  void dispose() {
    super.dispose();
    Hive.close();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive'),
      ),
      body: ValueListenableBuilder<Box<AmountModel>>(
        valueListenable: HiveBox.getAmount().listenable(),
        builder: (context, box, widget) {
          var amounts = box.values.toList();
          return buildList(amounts);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          addAmount(context, null);
          },
        child: const Icon(Icons.add),
      ),
    );
  }

  void addAmount(BuildContext context, AmountModel? amount) {

    if(amount != null){
      textController.text= amount.name;
      amountController.text = amount.amount.toString();
      isPlus = amount.isPlus;
    }

    showDialog(
      context: context,
      builder: (context)=>StatefulBuilder(builder: (context, setState){
        return AlertDialog(
          title: Column(
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(hintText: 'Ba�l�k'),
              ),
              TextField(
                controller: amountController,
                decoration: InputDecoration(hintText: 'Miktar'),
              ),
              RadioListTile(
                value: true,
                groupValue: isPlus,
                onChanged: (value) {
                  setState(() {
                    isPlus = value;
                  });
                },
                title:Text('True'),
              ),
              RadioListTile(
                value: false,
                groupValue: isPlus,
                onChanged: (value) {
                  setState(() {
                    isPlus = value;
                  });
                },
                title:Text('False'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: (){
                if(amount == null) {
                  //ekleme i�lemi
                  var amount = AmountModel()
                    ..name = textController.text
                    ..amount = double.parse(amountController.text)
                    ..isPlus = isPlus;
                  var box = HiveBox.getAmount();
                  box.add(amount);
                }else{
                  //g�ncelleme i�lemi
                  amount
                    ..name = textController.text
                    ..amount = double.parse(amountController.text)
                    ..isPlus = isPlus;
                  amount.save();
                }
                textController.clear();
                amountController.clear();
                Navigator.pop(context);
              },
              child:  amount == null ? const Text('Kaydet'): const Text('G�ncelle'),
              style: ElevatedButton.styleFrom(shadowColor: Colors.red),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text('Vazge�')),
          ],
        );
      }),
    );
  }

  Widget buildList(List<AmountModel> amounts) {
    if (amounts.isEmpty){
      return Center(child: Text('Empty List'),
      );
    } else {
      var totalAmount = amounts.fold<double>(
          0,
          (previousValue, element) => element.isPlus
            ? previousValue + element.amount
            : previousValue - element.amount);

      var color;
      if (totalAmount > 0) {
        color = Colors.green;
      } else {
        color = Colors.red;
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              totalAmount.toString(),
              style: TextStyle(color: color, fontSize: 30),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: amounts.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    child: ExpansionTile(
                      title: Text(amounts[index].name),
                      trailing: Text(amounts[index].amount.toString()),
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            var thisAmount = amounts[index];
                            thisAmount.delete();
                          },
                          icon: const Icon(Icons.delete),
                          label: const Text('Sil'),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            addAmount(context, amounts[index]);
                          },
                          icon: const Icon(Icons.update),
                          label: const Text('G�ncelle'),
                        ),
                      ],
                    ),
                  );
                },
            ),
          ),
        ],
      );
    }
  }
}
