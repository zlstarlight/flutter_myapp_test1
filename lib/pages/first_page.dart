import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/pages/login_page.dart';

// Stateless を継承する Widget を作成する
class FirstPage extends ConsumerWidget {
  const FirstPage({Key? key}) : super(key: key);
  // build メソッドを書き換え、build メソッドの戻り値は Widget 型、戻り値は画面に表示されているコンテンツです。
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // MaterialApp コントロール インターフェースのスタイルは Android スタイルです
    // CupertinoApp インターフェイスのスタイルは iOS スタイルです
    return MaterialApp(
      title: 'Androidでタスク管理を切り替える際のタスク名',
      // スキャフォールディング: スキャフォールディングは、appBar、body、bottomNavigationBar
      // などの基本的なフレームワーク構造を表示するために使用されます。
      home: Scaffold(
        // AppBar：iOS ナビゲーション バーに相当
        appBar: AppBar(
          // AppBar にコンテンツを表示する
          // Text はテキスト コンテンツの表示に使用されます。これは、iOS の UILabelAppBar の表示コンテンツに相当します。
          title: const Text('FISRT PAGE'),
        ),
        // body：AppBar と BottomNavigationBar の間に表示されるコンテンツ
        // Center 子ウィジェットを中央に配置するために使用されるウィジェットです

        body: Center(
            child: Column(
          children: <Widget>[
            const SizedBox(
              height: 200,
            ),
            // Image.network('https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Fb27249e2-6b7c-4253-97a7-00e4e1dd9bc7%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1684131457&t=6783946f9263c6efeba7bba67eddd5a0'),
            Image.asset('asserts/images/first_page.png'),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
                child: const Text('LOGIN')),
          ],
        )),
      ),
    );
  }
}
