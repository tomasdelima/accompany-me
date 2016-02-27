class Experience < Learnable
  def name
    description.slice(0, 100)
  end

  def show_fields
    [
      {name: :description,         type: :text_area,    options: {class: :wysihtml5, autofocus: true}},
      {name: :occurrence_date,     type: :text_field,   options: {value: occurrence_date.try(:strftime, '%d/%m/%Y'), class: :datepicker}},
      {name: :experienceable_type, type: :hidden_field, options: {}},
      {name: :experienceable_id,   type: :hidden_field, options: {}},
      {name: :experienceable,      type: :text_field,   options: {value: experienceable.try(:name), disabled: true}, reference: true},
    ]
  end

  def model_name
    I18n.t('activerecord.model.experience')
  end
end
