# README

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :word_users
- has_many :words, through: word_users
- has_many :scores

## words テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| eng_word | string | null: false |
| meaning  | string | null: false |

### Association

- has_many :word_users
- has_many :users, through: word_users

## word_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| word   | references | null: false, foreign_key: true |

### Association

- belongs_to :word
- belongs_to :user

## scores テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| test_score | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user