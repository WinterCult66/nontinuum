defprotocol Nontinuum.MongoHandler do
  def create(data)
  def delete(data)
  def find_all(data)
  def update(data, set)
end
