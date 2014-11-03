::Cylons.configure do |config|
  #if you are running multiple machines, connect to the ZK registry machine via:
  # config.registry_address = "X.X.X.X"
  config.remote_namespace = "StaticAdmin"
  config.port = "9022"
  config.registry_adapter = :zk
end
