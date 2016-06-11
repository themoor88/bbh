# frozen_string_literal: true
class Sector < ClassyEnum::Base
end

class Sector::MedicalDevices < Sector
end

class Sector::Cosmetic < Sector
end

class Sector::EHealth < Sector
  def id
    'EHealth'
  end

  def name
    'eHealth'
  end
end

class Sector::Pharmaceuticals < Sector
end

class Sector::BioPharmaceuticals < Sector
  def id
    'BioPharmaceuticals'
  end

  def name
    'BioPharmaceuticals'
  end
end

class Sector::AgriFood < Sector
  def id
    'Agri-Food'
  end

  def name
    'Agri-Food'
  end
end

class Sector::Aerospace < Sector
end

class Sector::Automotive < Sector
end

class Sector::BioProducts < Sector
  def id
    'BioProducts'
  end

  def name
    'BioProducts'
  end
end

class Sector::Chemicals < Sector
end

class Sector::DigitalTech < Sector
  def id
    'Digital and Tech'
  end

  def name
    'Digital and Tech'
  end
end

class Sector::Machinery < Sector
end

class Sector::Energy < Sector
  def id
    'Energy and Resources'
  end

  def name
    'Energy and Resources'
  end
end

class Sector::Telecom < Sector
end

class Sector::Other < Sector
end
