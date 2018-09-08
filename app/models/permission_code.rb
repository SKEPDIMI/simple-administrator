class PermissionCode < ApplicationRecord
  validates :body,
    presence: true,
    uniqueness: true

  validates :role,
    presence: true
end
