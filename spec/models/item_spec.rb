# -*- encoding: utf-8 -*-

require 'rails_helper'

RSpec.describe Item, type: :model do

  specify { should have_db_column(:id) }
  specify { should have_db_column(:name) }
  specify { should have_db_column(:picture_file_name) }
  specify { should have_db_column(:picture_content_type) }
  specify { should have_db_column(:picture_file_size) }
  specify { should have_db_column(:picture_updated_at) }

  specify { should allow_mass_assignment_of(:name) }
  specify { should allow_mass_assignment_of(:picture) }

  specify { should validate_presence_of(:name) }

end
