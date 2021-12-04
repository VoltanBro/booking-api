# frozen_string_literal: true

class EntityCreator < BaseInteractor
  def call
    create_entity
  end

  private

  def create_entity
    user = Constants::Auth::USERS_TYPE[context.params[:user_type]].new(entity_params)
    if user.valid?
      user.save
      context.user = user
    else
      fail_context(user.errors.full_messages, :unprocessable)
    end
  end

  def entity_params
    context.params
  end
end
