class Report < ActiveRecord::Base

	  scope: :orders_by_day -> { Order.where("date BETWEEN ? AND ?", start_date , end_date).group('date').count}

end