class TobdWorker
  include Sidekiq::Worker

  def perform (like, views, posted_at, wald)
  	raiting = like.to_f/views.to_f*1000
	if df = Vk.find_by(:wall => wald.to_s)
 		df.update_attribute(:raiting, raiting.round(2))
		df.update_attribute(:v_views, views)
		df.update_attribute(:v_like, like)
		df.update_attribute(:posted_at, posted_at)
	end

		# if df[:created_at] > Date.today - 7.days
		# 	# df.update_attribute(:raiting, -20)
		# end

	end
end