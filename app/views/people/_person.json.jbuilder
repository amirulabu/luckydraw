json.extract! person, :id, :name, :petid, :created_at, :updated_at
json.url person_url(person, format: :json)