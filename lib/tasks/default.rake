if Rails.env == "production"
	Rake.application.instance_variable_get("@tasks").delete("db:drop")
	Rake.application.instance_variable_get("@tasks").delete("db:schema:load")
	Rake.application.instance_variable_get("@tasks").delete("db:setup")
end