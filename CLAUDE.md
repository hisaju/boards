# CLAUDE.md - エージェント支援ガイド

## コマンド
- JS ビルド: `yarn build`
- CSS ビルド: `yarn build:css`
- サーバー起動: `bin/rails server`
- 開発環境: `bin/dev` (foreman経由で全サービス起動)
- テスト実行: `bin/rspec [ファイルパス:行番号]`
- 単一テスト: `bin/rspec spec/path/to_spec.rb:行番号`
- リント: `bin/rubocop [--auto-correct]`
- セキュリティスキャン: `bin/brakeman`

## コードスタイル・規約
- Ruby: Rails御膳スタイル (rubocop-rails プリセット)
- フロントエンド: Tailwind CSS でスタイリング
- JS: Stimulus でインタラクション、Turbo でページ更新
- モデル: ActiveRecord バリデーション使用、コールバックは控えめに
- コントローラー: 薄く保ち、Strong Parameters を使用
- ビュー: 再利用可能なコンポーネントにはパーシャルを使用
- エラー処理: Rails の規約に従い、コントローラーでrescue
- 命名規則: Rubyはsnake_case、JSはcamelCase
- 画像: Cloudinary を使用 (cloudinary.yml参照)

## サービス
デプロイ先: Back4app、Neon (PostgreSQL)、Upstash、Cloudinary