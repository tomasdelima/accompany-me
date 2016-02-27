class Accompaniment < Experienceable
  validates :subject, presence: true

  def name
    subject
  end

  def show_fields
    [
      :subject,
      :accompaniable,
      :plans,
      :achievements,
      :observations,
      :date_time,
      :place,
    ]
  end

  def model_name
    I18n.t('activerecord.model.accompaniment')
  end
end
