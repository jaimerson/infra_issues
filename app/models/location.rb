class Location < ApplicationRecord
  validates :name, :floor, presence: true

  enum floor: {
    first: 'first',
    second: 'second',
    third: 'third',
    fourth: 'fourth',
    outside: 'outside'
  }, _suffix: :floor

  has_many :issues

  def self.options_for_floor_select
    floors.keys.map do |floor|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.floor.#{floor}"), floor]
    end
  end
end
