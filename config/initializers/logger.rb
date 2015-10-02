#Override logger class for adding a method for register exception
Logger.class_eval do
  def exception(exception=$!, log = :error, backtrace_count=10)
    self.send(log, "Thread: #{Thread.current.object_id} -- #{exception.class}: #{exception.message}")
    self.send(log, "Obj: #{$!.record.inspect}") if $!.is_a?(ActiveRecord::RecordInvalid)
    exception.backtrace[0..backtrace_count].each { |line| self.send(log, line) }
  end
  alias  :exc :exception
end