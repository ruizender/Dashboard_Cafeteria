class HomeController < ApplicationController

    def index
        @sales_all = Sale.group_by_month(:sale_date, last: 12).sum(:price)
        @sales_amount_month = Sale.group_by_month(:sale_date, last: 12).sum(:amount)
        @sales_average = Sale.group_by_month(:sale_date, last: 12).average(:amount)
        
        @sales_amount12 = Sale.where('sale_date > ?', 1.year.ago
        ).group(:origin).count

        @sales_amount6 = Sale.where('sale_date > ?', 6.month.ago
        ).group(:origin).count

        @sales_amount3 = Sale.where('sale_date > ?', 3.month.ago
        ).group(:origin).count

        @sales_amount1 = Sale.where('sale_date > ?', 1.month.ago
        ).group(:origin).count

        @sales_blend_coffee12 = Sale.where('sale_date > ?', 1.year.ago
        ).group(:blend_coffee).count 
        
        @sales_blend_coffee6 = Sale.where('sale_date > ?', 6.month.ago
        ).group(:blend_coffee).count  

        @sales_blend_coffee3 = Sale.where('sale_date > ?', 3.month.ago
        ).group(:blend_coffee).count 

        @sales_blend_coffee1 = Sale.where('sale_date > ?', 1.month.ago
        ).group(:blend_coffee).count
    end
end
