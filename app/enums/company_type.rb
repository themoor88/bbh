# frozen_string_literal: true
class CompanyType < ClassyEnum::Base
end

class CompanyType::TechSeeker < CompanyType
end

class CompanyType::TechProvider < CompanyType
end
