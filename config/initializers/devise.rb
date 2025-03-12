# frozen_string_literal: true

Devise.setup do |config|
  # メールアドレスをキーとして利用
  config.mailer_sender = 'please-change-me@example.com'

  # Deviseが認証を実行するORM（通常はActiveRecord）
  require 'devise/orm/active_record'

  # パスワードの最小文字数
  config.password_length = 6..128

  # メールアドレスの大文字小文字を区別しないようにする
  config.case_insensitive_keys = [:email]

  # ホワイトスペースを削除
  config.strip_whitespace_keys = [:email]

  # セッションのタイムアウト設定（オプション）
  config.timeout_in = 30.minutes if config.respond_to?(:timeout_in)

  # ロック戦略（オプション）
  config.lock_strategy = :failed_attempts if config.respond_to?(:lock_strategy)

  # 解錠戦略（オプション）
  config.unlock_strategy = :email if config.respond_to?(:unlock_strategy)

  # 確認メールを有効化する場合
  config.confirm_within = 3.days if config.respond_to?(:confirm_within)

  # サインアウト時のリダイレクト
  config.sign_out_via = :delete
end
