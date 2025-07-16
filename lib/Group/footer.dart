import 'package:flutter/material.dart';

/// A responsive footer widget converted from the provided HTML.
/// Add the logo images to your assets and declare them in pubspec.yaml.
class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      color: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 640;
          return Wrap(
            alignment: WrapAlignment.start,
            spacing: 32,
            runSpacing: 24,
            children: [
              // ───────────────────────── Logo & Explanation
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 320),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        // TODO: Navigate to home page
                      },
                      child: Image.asset(
                        isWide ? 'assets/logo_l.png' : 'assets/logo_s.png',
                        height: 64,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'あにこれは、おもしろいアニメが見たい！\n'
                      'アニメ選びで失敗したくない！\n'
                      'そんな仲間達のためのランキング&口コミサイトです。',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),

              // ───────────────────────── Search & Counts
              SizedBox(
                width: isWide ? 320 : constraints.maxWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _FooterSearchBox(),
                    SizedBox(height: 16),
                    _CountBox(),
                  ],
                ),
              ),

              // ───────────────────────── Link Lists
              _LinkListSection(
                heading: 'アニコレ',
                links: [
                  ('人気アニメランキング', '/pop_ranking/'),
                  ('おすすめTVアニメ人気ランキング', '/pop_ranking/ac:tv/'),
                  ('おすすめアニメ映画人気ランキング', '/pop_ranking/ac:movie/'),
                  ('アニメ掲示板', '/boards/'),
                  ('最近投稿されたレビュー', '/reviews/recent_review/'),
                  ('新着ぼくわたBEST10', '/anime_rankings/recent/'),
                  ('アニメレビュー投稿数ランキング', '/rev_ranking/monthly/'),
                  ('サンキュー獲得数ランキング', '/thank_ranking/monthly/'),
                  ('アニメ映画まとめ', '/youtube/'),
                  ('動画配信サービス比較ランキング', '/broadcast/'),
                  ('50音でアニメをさがす', '/50on/'),
                ],
              ),
              _LinkListSection(
                heading: '放送時期別ランキング',
                links: [
                  ('2025年放送アニメ', '/chronicle/2025/'),
                  ('冬(1月〜3月)', '/chronicle/2025/winter/'),
                  ('春(4月〜6月)', '/chronicle/2025/spring/'),
                  ('夏(7月〜9月)', '/chronicle/2025/summer/'),
                  ('秋(10月〜12月)', '/chronicle/2025/autumn/'),
                  ('2024年放送アニメ', '/chronicle/2024/'),
                  ('2023年放送アニメ', '/chronicle/2023/'),
                  ('2022年放送アニメ', '/chronicle/2022/'),
                  ('2021年放送アニメ', '/chronicle/2021/'),
                  ('2020年放送アニメ', '/chronicle/2020/'),
                ],
              ),
              _LinkListSection(
                heading: '成分タグランキング',
                links: [
                  ('主人公最強', '/tag/主人公最強/'),
                  ('神アニメ', '/tag/神アニメ/'),
                  ('恋愛', '/tag/恋愛/'),
                  ('ラブコメ', '/tag/ラブコメ/'),
                  ('異世界', '/tag/異世界/'),
                  ('バトル', '/tag/バトル/'),
                  ('学園', '/tag/学園/'),
                  ('電撃文庫', '/tag/電撃文庫/'),
                  ('ハーレム', '/tag/ハーレム/'),
                  ('BL', '/tag/BL/'),
                  ('魔法', '/tag/魔法/'),
                  ('ファンタジー', '/tag/ファンタジー/'),
                  ('アニメ映画', '/tag/アニメ映画/'),
                  ('ラノベ原作', '/tag/ラノベ原作/'),
                  ('1話見たら止まらなくなる', '/tag/1話見たら止まらなくなる/'),
                  ('大人向け', '/tag/大人向け/'),
                  ('イケメン', '/tag/イケメン/'),
                  ('まんがタイムきらら', '/tag/まんがタイムきらら/'),
                ],
              ),
              _LinkListSection(
                heading: 'サイト情報',
                links: [
                  ('新規会員登録／ログイン', '/users/login/'),
                  ('アニメの棚', '/users/mypage/'),
                  ('利用規約', '/terms_of_use/'),
                  ('ガイドライン', '/guideline/'),
                  ('プライバシーポリシー', '/privacy_policy/'),
                  ('あにこれニュース一覧', '/infos/'),
                  ('お問い合わせ', '/contacts/'),
                  ('ビジネス／広告／コラボについて', '/businesses/'),
                  ('運営会社', '/company/'),
                  ('AKIRA上映会', '/features/akira/'),
                  ('新海誠 SPECIAL INTERVIEW', '/features/shinkai'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

// ───────────────────────────────────────────────────────── Private Widgets
class _FooterSearchBox extends StatefulWidget {
  const _FooterSearchBox();
  @override
  State<_FooterSearchBox> createState() => _FooterSearchBoxState();
}

class _FooterSearchBoxState extends State<_FooterSearchBox> {
  String _mode = 'searchAnimeByKeyword';
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownButton<String>(
          value: _mode,
          items: const [
            DropdownMenuItem(
              value: 'searchAnimeByKeyword',
              child: Text('アニメを作品名から探す'),
            ),
            DropdownMenuItem(
              value: 'searchAnimeByTag',
              child: Text('アニメを成分タグから探す'),
            ),
          ],
          onChanged: (val) => setState(() => _mode = val!),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'アニメや成分を検索',
              isDense: true,
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
            onSubmitted: (value) {
              // TODO: implement search logic
            },
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // TODO: implement search trigger
          },
        ),
      ],
    );
  }
}

class _CountBox extends StatelessWidget {
  const _CountBox();

  Widget _item(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 32,
      children: [
        _item('アニメ登録数', '14,977作'),
        _item('成分タグ数', '74,439個'),
        _item('昨日の棚登録', '650件'),
      ],
    );
  }
}

typedef LinkTuple = (String text, String route);

class _LinkListSection extends StatelessWidget {
  final String heading;
  final List<LinkTuple> links;

  const _LinkListSection({required this.heading, required this.links});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 240),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: theme.textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          ...links.map(
            (l) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: InkWell(
                onTap: () {
                  // TODO: navigate using your router
                },
                child: Text(
                  l.$1,
                  style: theme.textTheme.bodySmall!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
