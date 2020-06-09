class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # 対応するDBのテーブルを用意しない場合は、self.abstract_class = true を書く必要がある
end
