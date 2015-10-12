require 'rainbow'; Rainbow.enabled = true

require 'pathname'
require 'clock'
require 'dependency'; Dependency.activate

require 'telemetry/logger/logger'
require 'telemetry/logger/levels'
require 'telemetry/logger/color'
require 'telemetry/logger/null_object'
require 'telemetry/logger/console_logger'
require 'telemetry/logger/ad_hoc'
