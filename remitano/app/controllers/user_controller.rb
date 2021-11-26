class UserController < ApplicationController
	#login
		
		def checklogin
			username=params[:username].to_s
			pass=User.encodepassword(params[:password].to_s)
			users = User.where(["username = ? and password = ? ",username,pass]).order("id desc")
			if users.length >0
				session[:userid]=users[0].id
				 flash[:quicknotice]="Login sucess"
			else
				 flash[:quicknotice]="Login error"
			end
			redirect_to  :controller=>'home', :action=>"index"
		end
	#end
	# register
		def register
			
		end
		def addnewuser
			username=params[:username].to_s
			checkdata=User.where(["username = ?",username.to_s]).order("id desc")
			if checkdata.length>0
				flash[:quicknotice]="<div class='alert alert-danger'><strong>Warning!</strong> Account already exists.</div>"

			 redirect_to  :controller=>'user', :action=>"register"
			else
				User.create(username:username.to_s,password:User.encodepassword(params[:password].to_s))
			 flash[:quicknotice]="<div class='alert alert-success'><strong>Success!</strong> Account successfully created, please login.</div>"
			 redirect_to  :controller=>'user', :action=>"register"
			end
			
		end
	# end
	# Share movie
		def sharemovie

		end
		def addsharemovie
			
		end
	#end
		def logout
			reset_session
			redirect_to  :controller=>'home', :action=>"index"
		end

end