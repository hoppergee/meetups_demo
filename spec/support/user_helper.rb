module UserHelper

	def create_user opts = {}
		User.create!({email: 'foobar@example.com', password: '123456'}.merge(opts))
	end

	def logged_as user
		page.set_rack_session('warden.user.user.key' => User.serialize_into_session(user))
	end

end