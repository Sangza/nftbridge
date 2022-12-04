import 'dart:html';

import 'package:dart_web3/browser.dart';
import 'package:dart_web3/dart_web3.dart';
import 'package:nftbridge/constant.dart';
import 'package:nftbridge/contracts/goerli.g.dart';
import 'package:nftbridge/function.dart';
import 'package:web_socket_channel/io.dart';

class M {
  Web3Client? clientw;
  CredentialsWithKnownAddress? credentials;
  int tokenid = BigInt.parse(F().supply() as String) as int;
  final BigInt _dstChainId = BigInt.from(10109);

  BigInt dstChainId() {
    var chain = BigInt.parse('');
    return chain;
  }

  Future<void> connect() async {
    final eth = window.ethereum;
    if (eth == null) {
      print('MetaMask is not available');
      return;
    }

    clientw = Web3Client.custom(eth.asRpcService(), socketConnector: () {
      return IOWebSocketChannel.connect(Alchemy_wsurl).cast<String>();
    });
    credentials = await eth.requestAccount();
  }

  Goerli c() {
    final goerli = Goerli(address: goerliAddress, client: clientw!);
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

    await p.mint(
      credentials: credentials!,
    );
  }

  packed() async {
    Goerli p = c();
    await p.solidityPack(mumbaiaAddress, goerliAddress);
  }

  crossBridge(int tokenid) async {
    Goerli p = c();

    await p.CrossChainTransfer(
      _dstChainId,
      packed(),
      tokenid as BigInt,
      credentials: credentials!,
    );
  }
}
