# Load the rails application
require File.expand_path('../application', __FILE__)

# Disable the default XML params parser
ActionDispatch::ParamsParser::DEFAULT_PARSERS.delete(Mime::XML)

# Disable symbol and yaml parsing in the XML parser
ActiveSupport::XmlMini::PARSING.delete("symbol")
ActiveSupport::XmlMini::PARSING.delete("yaml")

# Initialize the rails application
Platz::Application.initialize!
