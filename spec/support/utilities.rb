include ApplicationHelper
def full_title(page_title)
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

Rspec::Matchers.define :have_error_message do|message|
  match do|page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end

def sign_in(user, option = {  })
  if option[:no_capybara]
    remeber_token = User.new_remember_token
    cookies[:remeber_token] = remeber_token
    user.update_attributes(:remeber_token, User.encrypt(remeber_token))
  else
    visit signin_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end
