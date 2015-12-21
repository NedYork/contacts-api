require 'addressable/uri'
require 'rest-client'
#
url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/1.json'
).to_s

# puts RestClient.get(url)

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.json',
#   query_values: {
#     'user[:name]' => 'new_name',
#     'user[:email]' => 'new_email',
#     'user[:address][:city]' => 'New York City'
#   }
# ).to_s



def create_user
  begin
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users.json'
    ).to_s
    puts RestClient.post(url, { user: { name: "Obi", email: "wanKenobi@gmail.com" } }
    )
  rescue
    raise RestClient::Exception
  end
end


# create_user




def update_user
  # begin
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users/5.json'
    ).to_s
    puts RestClient.patch(url, { user: { email: "princess@hotmail.com" } }
    )
  # rescue
    # raise RestClient::Exception
  # end
end

update_user

def destroy_user
  # begin
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users/1.json'
    ).to_s
    puts RestClient.delete(url, { user: { } }
    )
  # rescue
    # raise RestClient::Exception
  # end
end

# destroy_user
