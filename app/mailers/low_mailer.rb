class LowMailer < ApplicationMailer
	def searchm
	 # user = User.find(8)
		#  user.email
		return "bananvyhe@gmail.com"
	end
	def send_low_mail(id) 
		mail(to:id,from:"admin@farmspot.ru",subject:"Осталась неделя оплаченного времени")
	end
end
