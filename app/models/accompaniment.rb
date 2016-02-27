class Accompaniment < Experienceable
  validates :subject, presence: true

  def name
    subject
  end

  def show_fields
    [
      {name: :subject,            type: :text_field, options: {autofocus: true}},
      {name: :accompaniable_type, type: :hidden_field, options: {}},
      {name: :accompaniable_id,   type: :hidden_field, options: {}},
      {name: :accompaniable,      type: :text_field, options: {value: accompaniable.try(:name)}, reference: true},
      {name: :achievements,       type: :text_area,  options: {class: :wysihtml5}},
      {name: :plans,              type: :text_area,  options: {class: :wysihtml5}},
      {name: :observations,       type: :text_area,  options: {class: :wysihtml5}},
      {name: :date_time,          type: :text_field, options: {value: date_time.try(:strftime, '%d/%m/%Y') || Date.today, class: :datepicker}},
      {name: :place,              type: :text_field, options: {}},
    ]
  end

  def model_name
    I18n.t('activerecord.model.accompaniment')
  end
end
