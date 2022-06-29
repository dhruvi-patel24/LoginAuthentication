class PostPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if @user.role.name == "admin"
        scope.all
      else
        scope.where.not(content: "")
      end
    end
   
  end

  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
    # false - nobody has access
  end

  def create?
    return true if user.present? && user.role.name == "admin"
  end

  def destroy?
    return true if user.present? && user.role.name == "admin"
  end

  private
  def post
    record
  end
end
