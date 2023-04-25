class ActivitySerializer
  include JSONAPI::Serializer
  attributes :type, :destination, :forecast
end