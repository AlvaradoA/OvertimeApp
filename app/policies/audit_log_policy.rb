class AuditLogPolicy < ApplicationPolicy
  def index?
    return true if admin?
  end

  def confirm?
    same_user?
  end

  private

    def admin?
      admin_types.include?(user.type)
    end

    def same_user?
      record.user_id == user.id
    end
end
