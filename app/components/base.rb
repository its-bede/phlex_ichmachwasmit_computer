# frozen_string_literal: true

class Components::Base < Phlex::HTML
  include Components
  include Phlex::Rails::Helpers::T
  include Phlex::Rails::Helpers::ContentFor
  include Phlex::Rails::Helpers::LinkTo

  # Include any helpers you want to be available across all components
  include Phlex::Rails::Helpers::Routes

  if Rails.env.development?
    def before_template
      comment { "Before #{self.class.name}" }
      super
    end
  end

  if Rails.env.development?
    def after_template
      comment { "After #{self.class.name}" }
      super
    end
  end
end
