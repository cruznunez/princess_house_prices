class Item < ActiveRecord::Base
  def shipping
    return 0 unless price.positive?
    case price
    when 0..15_00
      1_50
    when 15_01..40_00
      3_50
    when 40_01..80_00
      5_50
    when 80_01..120_00
      7_50
    when 120_01..200_00
      9_50
    when 200_01..400_00
      15_00
    else
      30_00
    end
  end

  def tax
    (price + shipping) * 75/1000
  end

  def total
    price + shipping + tax
  end
end
