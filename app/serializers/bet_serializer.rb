class BetSerializer < ActiveModel::Serializer
  attributes :id, :challenge, :winner_id, :amount, :is_accepted
end 