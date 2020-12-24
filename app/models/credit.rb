class Credit
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :tell_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :house_number
    validates :tell_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  with_options presence: true, numericality: { other_than: 0 } do
    validates :prefecture_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShoppingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                           building_name: building_name, tell_number: tell_number, order_id: order.id)
  end
end
