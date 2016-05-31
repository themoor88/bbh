# frozen_string_literal: true
class State < ClassyEnum::Base
end

class State::Pending < State
end

class State::Active < State
end

class State::Deleted < State
end

class State::Expired < State
end
