defprotocol Nontinuum.MongoHandler do
  def create(handler, data)
  def delete(handler, data)
  def find_all(handler, data)
  def update(handler, data)
end
