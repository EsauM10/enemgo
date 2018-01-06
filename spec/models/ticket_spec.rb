# == Schema Information
#
# Table name: tickets
#
#  id              :integer          not null, primary key
#  message         :text
#  motive          :string
#  user_id         :integer
#  ticketable_type :string
#  ticketable_id   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_tickets_on_ticketable_type_and_ticketable_id  (ticketable_type,ticketable_id)
#  index_tickets_on_user_id                            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
