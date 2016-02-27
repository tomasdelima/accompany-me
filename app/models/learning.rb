class Learning < AbstractModel
  belongs_to :learnable, polymorphic: true

  def name
    summary
  end

  def show_fields
    [
      {name: :summary,        type: :text_field,   options: {}},
      {name: :description,    type: :text_area,    options: {class: :wysihtml5, autofocus: true}},
      {name: :learnable_type, type: :hidden_field, options: {}},
      {name: :learnable_id,   type: :hidden_field, options: {}},
      {name: :learnable,      type: :text_field,   options: {value: learnable.try(:name), disabled: true}, reference: true},
    ]
  end

  def model_name
    I18n.t('activerecord.model.learning')
  end
end
