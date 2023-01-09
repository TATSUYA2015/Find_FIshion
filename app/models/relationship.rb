class Relationship < ApplicationRecord
  #フォローする人側
  belongs_to :following, class_name: 'Customer'
  #フォローされる人側
  belongs_to :follower, class_name: 'Contributor'
end
