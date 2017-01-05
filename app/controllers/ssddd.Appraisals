destroy_items = []
	      	new_order_items = []
	      	
	      	order_params['order_items_attributes'].map do |k, v| 
	      		destroy_items << v if v['_destroy'].present?
	      		new_order_items << v if !v['id'].present?
	      	end

	      	if destroy_items.present? && new_order_items.present?
	      		 @order.send_notification_email(new_order_items , destroy_items)
	        elsif destroy_items.present?
	        	@order.send_notification_email(destroy_items)
	        else 
	        	binding.pry
	        	@order.send_notification_email(new_order_items)
	        end
