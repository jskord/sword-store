class Product < ApplicationRecord
  def sale_message
    if price.to_f < 100
      return "Discount Item!"
    else
      return "Everyday Value!"
    end
  end
  def tax
    return price.to_f * 0.09
  end
  def total
    return price.to_f + tax
  end
  def discount_item?
    price.to_f < 100
  end

end
