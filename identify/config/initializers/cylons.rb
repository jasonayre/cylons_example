::Cylons.configure do |config|
  #if you are running multiple machines, connect to the ZK registry machine via:
  # config.registry_address = "X.X.X.X"
  config.remote_namespace = "Identify"
  config.port = "9020"
  config.registry_adapter = :zk
end
