import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactons;
  final Function deleteTransactons;

  TransactionList(this.transactons, this.deleteTransactons);

  @override
  Widget build(BuildContext context) {
    //   return Container(
    //     height: 600,
    //     child: //SingleChildScrollView( child:
    //         ListView(
    //       // used to hold more than one widget
    //       children: transactons.map((tx) {
    //         return Card(
    //           child: Row(
    //             children: <Widget>[
    //               Container(
    //                 margin: EdgeInsets.symmetric(
    //                   vertical: 10,
    //                   horizontal: 15,
    //                 ),
    //                 decoration: BoxDecoration(
    //                   border: Border.all(
    //                     color: Colors.purple,
    //                     width: 2,
    //                   ),
    //                 ),
    //                 padding: EdgeInsets.all(10),
    //                 child: Text(
    //                   '\$${tx.amount}', // string interpolation
    //                   style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 20,
    //                     color: Colors.purple,
    //                   ),
    //                 ),
    //               ),
    //               Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: <Widget>[
    //                   Text(
    //                     tx.title,
    //                     style: TextStyle(
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                   Text(
    //                     DateFormat.yMMMd().format(tx.date),
    //                     style: TextStyle(color: Colors.grey),
    //                   )
    //                 ],
    //               )
    //             ],
    //           ),
    //         );
    //       }).toList(),
    //     ),
    //   );
    // }

    return transactons.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No transactions added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : ListView.builder(
            // have infinite height
            itemBuilder: (ctx, index) {
              // return Card(
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         margin: EdgeInsets.symmetric(
              //           vertical: 10,
              //           horizontal: 15,
              //         ),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).primaryColor,
              //             width: 2,
              //           ),
              //         ),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '\$${transactons[index].amount.toStringAsFixed(2)}', // string interpolation
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(
              //             transactons[index].title,
              //             // style: TextStyle(
              //             //   fontSize: 16,
              //             //   fontWeight: FontWeight.bold,
              //             // ),
              //             style: Theme.of(context).textTheme.headline6,
              //           ),
              //           Text(
              //             DateFormat.yMMMd().format(transactons[index].date),
              //             style: TextStyle(color: Colors.grey),
              //           )
              //         ],
              //       )
              //     ],
              //   ),
              // );
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text(
                              '\$${transactons[index].amount.toStringAsFixed(2)}')),
                    ),
                  ),
                  title: Text(
                    transactons[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactons[index].date),
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTransactons(transactons[index].id),
                  ),
                ),
              );
            },
            itemCount: transactons.length,
          );
  }
}
