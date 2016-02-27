class Learning < AbstractModel
  belongs_to :learnable, polymorphic: true

  def name
    summary
  end

  def show_fields
    [
      :description,
      :summary,
      :learnable,
    ]
  end

  def model_name
    I18n.t('activerecord.model.learning')
  end
end
