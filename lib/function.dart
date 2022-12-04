import 'dart:typed_data';

import 'package:nftbridge/constant.dart';
import 'package:nftbridge/contracts/goerli.g.dart';
import 'package:dart_web3/dart_web3.dart';
import 'package:http/http.dart';
import 'package:web_socket_channel/io.dart';

class F {
  final BigInt _dstChainId = BigInt.from(10109);

  final client = Web3Client(Alchemy_url, Client(), socketConnector: () {
    return IOWebSocketChannel.connect(Alchemy_wsurl).cast<String>();
  });
  credential() => EthPrivateKey.fromHex(privateKeyy);
  Future<String> ff() async {
    final ownAddress = await credential().extractAddress();
    return ownAddress.toString();
  }

  Goerli c() {
    final goerli = Goerli(address: goerliAddress, client: client);
    return goerli;
  }

  g() async {
    Goerli p = c();
    final alert = p.recieveEvents().take(1).listen((event) {
      print(
          '${event.from} see chainID ${event.srcChainId} get TokenId ${event.tokenId}!');
    });
  }

  mint() async {
    Goerli p = c();
    await p.mint(credentials: credential());
  }

  Future<Uint8List> packed() async {
    Goerli p = c();
    Uint8List pack = await p.solidityPack(mumbaiaAddress, goerliAddress);
    return pack;
  }

  crossnftbridge(int tokenid) async {
    Goerli p = c();
    await p.CrossChainTransfer(
      _dstChainId,
      packed() as Uint8List,
      tokenid as BigInt,
      credentials: credential(),
    );
  }

  Future<String> supply() async {
    Goerli p = c();
    return Future.delayed(Duration(seconds: 20), (() async {
      var supp = await p.supply();
      return supp.toString();
    }));
  }
}
