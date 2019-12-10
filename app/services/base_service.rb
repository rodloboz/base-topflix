# frozen_string_literal: true

class BaseService
  class << self
    def call(*args)
      new(*args).call
    end

    alias_method :perform, :call
  end

  def method_missing(method_name, *args, &block)
    if method_name == :perform
      call
    elsif method_name == :call
      perform
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    %i[call perform].include?(method_name) || super
  end
end
