class Experience < Learnable
  def name
    description.slice(0, 100)
  end

  def show_fields
    [
      :description,
      :occurrence_date,
      :experienceable,
    ]
  end

  def model_name
    I18n.t('activerecord.model.experience')
  end
end
