class Activity < Accompaniable
  validates :name, :organizer_id, presence: true

  def next_occurrence
    if last_occurrence
      case frequency.parameterize
      when 'diario'     then last_occurrence + 1.day
      when 'semanal'    then last_occurrence + 1.week
      when 'bisemanal'  then last_occurrence + 2.weeks
      when 'mensal'     then last_occurrence + 1.month
      when 'trimestral' then last_occurrence + 3.months
      when 'anual'      then last_occurrence + 1.year
      end
    end
  end

  def since_last_occurrence
    if last_occurrence
      d = (Date.today - last_occurrence.to_date).to_i
      case d
      when 0 then "hoje"
      when 1 then "amanhã"
      else "#{d} dia#{'s' if d > 1} atrás"
      end
    else
      "nunca aconteceu"
    end
  end

  def until_next_occurrence
    if next_occurrence
      d = (next_occurrence.to_date - Date.today).to_i
      case d
      when 0 then "hoje"
      when 1 then "amanhã"
      else "em #{d} dia#{'s' if d > 1}"
      end
    else
      "indefinido"
    end
  end

  def since_last_accompanied
    if last_accompanied
      d = (Date.today - last_accompanied.to_date).to_i
      "(#{d} dia#{'s' if d > 1} atrás)"
    end
  end

  def next_accompaniment
    if last_accompanied && accompaniment_frequency
      last_accompanied + accompaniment_frequency.days
    end
  end

  def until_next_accompaniment
    if next_accompaniment
      d = (next_accompaniment.to_date - Date.today).to_i
      "(em #{d} dia#{'s' if d > 1})"
    end
  end
end
