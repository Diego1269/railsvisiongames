if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_vsgames", domain: "http://localhost:3001"
else
  Rails.application.config.session_store :cookie_store, key: "_vsgames"
end
