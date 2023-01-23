class Project < ApplicationRecord
    has_many :project_members
    enum :status, {new_project: 0, ongoing: 1 , delayed: 2, paused: 3 , completed: 4}
    enum :phase, {design: 1, prototype: 2, roadmap: 3, mvp: 4 , full_build: 5}
    enum :category, {ecommerce: 1, sales: 2, marketing:3, erp: 4, healthcare: 5}
end
