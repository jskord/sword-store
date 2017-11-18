class Product < ApplicationRecord
  def sale_message
    if price.to_f < 100
      return "Discount Item!"
    else
      return "Everyday Value!"
    end
  end
end
