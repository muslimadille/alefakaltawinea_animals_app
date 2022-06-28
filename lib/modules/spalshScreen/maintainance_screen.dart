import 'package:alefakaltawinea_animals_app/modules/baseScreen/baseScreen.dart';
import 'package:flutter/Material.dart';

class MaintainanceScreen extends StatefulWidget {
  const MaintainanceScreen({Key? key}) : super(key: key);

  @override
  State<MaintainanceScreen> createState() => _MaintainanceScreenState();
}

class _MaintainanceScreenState extends State<MaintainanceScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: Container(
      child: Center(child: Text("التطبيق في الصيانة حاليا الراجاء الانتظار"),),
    ), showSettings: false, showBottomBar: false, tag: "");
  }
}
