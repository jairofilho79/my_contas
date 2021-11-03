import 'package:my_contas/models/transacao.dart';
import 'package:my_contas/utils/db_util.dart';

class TransacaoService {
  List<Transacao> _transacaoList = [];

  void addTransacao(Transacao transacao) {
    DbUtil.insertData('transacao', transacao.toMap());
  }

  Future<List> getAllTransacoes() async {
    final dataList = await DbUtil.getData('transacao');
    _transacaoList =
        dataList.map((transacoes) => Transacao.fromMap(transacoes)).toList();
    return _transacaoList;
  }
}
