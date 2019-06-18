class Issue < ApplicationRecord
  validates :title, presence: true

  enum status: {
    open: 0,
    waiting: 1,
    closed: 2,
    waiting_confirmation: 3,
    finished: 4
  }

  enum priority: {
    low: 0,
    medium: 1,
    high: 2,
    urgent: 3
  }

  scope :active, -> { where(status: %i[open waiting waiting_confirmation]) }
  scope :inactive, -> { where(status: %i[closed finished]) }

  belongs_to :reporter, class_name: 'User', foreign_key: :reported_by
  belongs_to :location

  def self.options_for_priority_select
    priorities.keys.map do |priority|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.priorities.#{priority}"), priority]
    end
  end

  def self.options_for_status_select
    statuses.keys.map do |status|
      [I18n.t("activerecord.attributes.#{model_name.i18n_key}.statuses.#{status}"), status]
    end
  end
end
