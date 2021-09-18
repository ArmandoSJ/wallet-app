import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wallet_app/src/backend/models/services.dart';
import 'package:wallet_app/src/backend/models/user_model.dart';
import 'package:wallet_app/src/providers/services_provider.dart';
import 'package:wallet_app/src/utils/notification-app.dart';
import 'package:wallet_app/src/utils/preferencias_usuario.dart';

class ServicesHidden extends StatefulWidget {
  @override
  createState() => _ServicesHiddenState();
}

class _ServicesHiddenState extends State<ServicesHidden> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _ListOfServices(),
    );
  }
}

// ignore: must_be_immutable
class _ListOfServices extends StatefulWidget {
  final User user = new User();

  final _prefs = new PreferenciasUsuario();

  final serviceProvider = new ServiciosProvider();

  late List<Services> _lstService;

  @override
  State<_ListOfServices> createState() => _ListOfServicesState();
}

class _ListOfServicesState extends State<_ListOfServices> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    widget.user.vUserId = widget._prefs.usuarioid;
    widget.user.vPassword = "";

    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height,
      child: FutureBuilder(
        future: widget.serviceProvider.getServices('A'),
        builder: (BuildContext context, AsyncSnapshot<List<Services>> snapshot) {
          if (snapshot.hasData) {
            final vServices = snapshot.data!;
            return ListView.separated(
                key: Key(vServices.length.toString()),
                itemCount: vServices.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (contex, i) {
                  widget._lstService = vServices;
                  return _crearListaSlidable(vServices[i], i);
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _crearListaSlidable(Services service, int index) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      actions: <Widget>[
        IconSlideAction(
            caption: 'Pagar',
            color: Colors.green,
            icon: Icons.visibility,
            onTap: () => _showSnackBar(index, service)),
      ],
      child: _BuildListTile(service: service),
    );
  }

  void _showSnackBar(int index, Services service) async {
    Map vResponse =
        await widget.serviceProvider.doPayment("A");
    if (vResponse['status']) {
      setState(() {
        widget._lstService.removeAt(index);
      });

      NotificationsApp.showSnackbar("Pago realizado", Colors.green);
    } else {
      String vMsjerror =
          vResponse['message']; //this message will be cutted and improved
      NotificationsApp.showSnackbar(vMsjerror, Colors.red);
    }
  }
}

class _BuildListTile extends StatelessWidget {
  final Services service;
  const _BuildListTile({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 0,
      ),
      title: Text('Descripcion: ${service.description} '),
      subtitle:
          Text('Precio: ${service.price} - Categoria: ${service.category}'),
      onTap: () {},
    );
  }
}