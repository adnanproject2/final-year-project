class EmailHistory < ApplicationRecord
    belongs_to :task, optional: true
    belongs_to :account, optional: true
end
