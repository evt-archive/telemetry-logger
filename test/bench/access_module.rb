require_relative 'bench_init'

context "Access Module" do
  AccessModule = Class.new do
    include Telemetry::Logger::Access
  end

  obj = AccessModule.new

  test "Adds the logger accessor" do
    assert(obj.respond_to? :logger)
  end

  test "Logs" do
    obj.logger.pass "Logs"
  end
end
