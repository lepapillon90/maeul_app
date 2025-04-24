import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:maeul_app/ui/pages/auth/join/logic/join_controller.dart';

final List<SingleChildWidget> globalProviders = [
  ChangeNotifierProvider(create: (_) => JoinController()),
];