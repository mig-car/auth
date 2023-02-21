class SessionsController < ApplicationController
    def new
    end

    def create
        # check if user exists
        @user = User.find_by({"email" => params["email"]})

        if @user
        # if they do, check that they know their password
            if BCrypt::Password.new(@user["password"]) == params["password"]
                cookies["monster"] = "me like cookies"
                
                # session[] is a hash of cookies not available to the end user. It's available to the browser, though. 
                # this is so savvy users cannot edit the cookies via dev tools on browser.
                session["user_id"] = @user["id"]

                # if they do, send them in...
                flash["notice"] = "Welcome!"
                redirect_to "/companies"
            else
                redirect_to "/sessions/new"
            end
        else
            redirect_to "/sessions/new"
        end
    end

    def destroy
        session["user_id"] = nil
        redirect_to "/sessions/new"
    end

end
