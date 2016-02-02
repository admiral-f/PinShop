Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "417848128426013", "8b1dc4f4e9f36ca0a7a0ea6c3137307b"
end