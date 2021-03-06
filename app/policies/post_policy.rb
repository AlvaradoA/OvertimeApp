class PostPolicy < ApplicationPolicy

  def update?
    return true if post_approved? && admin?
    return true if creator_or_admin && !post_approved?
  end

  def approve?
    admin?
  end

  def reject?
    admin?
  end

  private

    def creator_or_admin
      record.user_id == user.id || admin?
    end

    def admin?
      admin_types.include?(user.type)
    end

    def post_approved?
      record.approved?
    end
end
