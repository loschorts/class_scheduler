json.partial! "api/users/user", user: tutor
json.classes_taught do
	json.array! tutor.klasses do |klass|
		json.partial! "api/klasses/klass", klass: klass
	end
end