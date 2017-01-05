class ReportsController < ApplicationController

	require 'date'

	def order_by_date
		
	 if params[:start_date].present? && params[:end_date].present? 
	 		start_date = params[:start_date].to_date
			end_date = params[:end_date].to_date 
	 		orders_by_day = Order.where("date BETWEEN ? AND ?", start_date , end_date).group('date').count
	 		@data = (start_date.to_date..end_date.to_date).each_with_object({}) do |date, hash|
	 					hash[date] = orders_by_day.fetch(date, 0)
					end

	 		render json: @data
	 elsif params[:start_date].present? || params[:end_date].present?

	 		@date  = params[:start_date].present? ? params[:start_date].to_date : params[:end_date].to_date
	 		@data = Order.where(date: @date).group('date').count
	 		render json: @data

	 end

	end

	def order_items_by_date
		
	 if params[:start_date].present? && params[:end_date].present? 
	 		start_date = params[:start_date].to_date
			end_date = params[:end_date].to_date 
	 		orders_by_day = Order.where("date BETWEEN ? AND ?" , start_date , end_date).joins(:order_items).group('date').count
	 		@data = (start_date.to_date..end_date.to_date).each_with_object({}) do |date, hash|
	 					hash[date] = orders_by_day.fetch(date, 0)
					end
	 		render json: @data
	 elsif params[:start_date].present? || params[:end_date].present?

	 		@date  = params[:start_date].present? ? params[:start_date].to_date : params[:end_date].to_date
	 		@data = Order.where(date: @date).joins(:order_items).group('date').count
	 		render json: @data


	 end
	end
end