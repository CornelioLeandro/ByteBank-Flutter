import 'package:bytebank/ui/screens_contact/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text("Leandro",
              style: TextStyle(
                fontSize: 24.0,
              ),
              ),
              subtitle: Text('1000'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ContactForm(),
          ),
          ).then((newContact) => debugPrint(newContact.toString()),
          );
        },
        child: const Icon(Icons.add)
        ),
      );
  }
}
