module ApplicationHelper
		require "uri"

	def true_url url_string
		return nil if url_string.blank?
		if ! url_string.match "^http://"
			url_string = Rails.application.routes.default_url_options[:host] + url_string if  url_string.match "^/"
			url_string = "http://" + url_string
		end

		url = URI.parse url_string
		url.path = "/" if url.path.blank?
		url
	end

	def check_url(url_string)

		require "net/http"

		url = true_url url_string
		!Net::HTTP.get_response( url ).code.to_i.in?(400..499) rescue false

	end

	def redirect_path obj, request
		res = request.env["HTTP_REFERER"]
		res = url_for(obj) if request.env["HTTP_REFERER"] == url_for([ :edit, obj ])
		puts res
		res

	end


end

