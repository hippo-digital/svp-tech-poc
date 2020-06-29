# frozen_string_literal: true

class FormResponse
  include Dynamoid::Document

  table name: Rails.configuration.submissions_db_table_name, key: :ReferenceId
  field :ReferenceId, :string
  field :NHSSub, :string
  range :UnixTimestamp, :datetime

  field :FormResponse, :map

  global_secondary_index hash_key: :NHSSub
end
