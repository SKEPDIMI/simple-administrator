json.extract! worker, :id, :first_name, :last_name, :time_worked, :responsibility, :pay, :created_at, :updated_at
json.url worker_url(worker, format: :json)
