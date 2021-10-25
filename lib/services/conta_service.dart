import 'package:my_contas/models/conta.dart';
import 'package:my_contas/utils/db_util.dart';

class ContaService {
  List<Conta> _contaList = [];

  void addConta(Conta conta) {
    DbUtil.insertData('conta', conta.toMap());
  }

  Future<List> getAllContas() async {
    final dataList = await DbUtil.getData('conta');
    _contaList = dataList.map((contas) => Conta.fromMap(contas)).toList();
    return _contaList;
  }
}
