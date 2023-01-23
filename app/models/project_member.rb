class ProjectMember < ApplicationRecord
  belongs_to :project
  enum :role, {team_member: 0, stakeholder: 1 , manager: 2, superadmin: 3}
end
