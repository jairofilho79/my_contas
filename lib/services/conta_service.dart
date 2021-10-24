import 'package:my_contas/models/conta.dart';
import 'package:my_contas/utils/db_util.dart';

class ContaService {
  void addConta(Conta conta) {
    DbUtil.insertData('conta', conta.toMap());
  }
}
