# frozen_string_literal: true
class Title < ClassyEnum::Base
end

class Title::Dr < Title
  def to_s
    'Dr.'
  end
end

class Title::Mrs < Title
  def to_s
    'Mrs.'
  end
end

class Title::Ms < Title
  def to_s
    'Ms.'
  end
end

class Title::Mr < Title
  def to_s
    'Mr.'
  end
end
