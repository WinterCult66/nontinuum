defprotocol Nontinuum.MongoHandler do
  def create(data, handlerx)
  def delete(data, handlerx)
  def find_all(data, handlerx)
  def update(data, set, handlerx)
end
