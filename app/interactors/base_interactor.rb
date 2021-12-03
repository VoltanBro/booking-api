# frozen_string_literal: true

class BaseInteractor
  include Interactor

  private

  def fail_context(message = nil, status = nil)
    context.fail!(error: message, status: status)
  end
end
