require_relative 'app'
require_relative 'json_db'

def main
  app = App.new
  load_state(app)
  app.run
  save_state(app)
end

main
