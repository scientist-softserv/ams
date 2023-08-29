# frozen_string_literal: true
unless App.rails_5_1?

  # Generated via
  #  `rails generate hyrax:work_resource AssetResource`
  require 'rails_helper'
  require 'hyrax/specs/shared_specs/hydra_works'

  RSpec.describe AssetResource do
    subject(:work) { described_class.new }

    it_behaves_like 'a Hyrax::Work'
  end
end
