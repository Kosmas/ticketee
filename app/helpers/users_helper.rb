module UsersHelper
  def text_for_submit_button
    if params[:action] == ("edit" || "update")
      "Update Profile"
    else
      "Sign up"
    end
  end
end
