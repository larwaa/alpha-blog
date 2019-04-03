module ApplicationHelper
	def image_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, alt: user.username, class: "card-img", style: "object-fit: cover; height: 100%;")
	end
end
