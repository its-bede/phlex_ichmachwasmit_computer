# frozen_string_literal: true

class Components::Card < Components::Base
  def initialize(title: nil)
    @title = title
  end

  def view_template(&block)
    div(class: "card") do
      yield
    end
  end

  def header(&block)
    return unless block_given?

    div(class: 'card-header', &block)
  end

  def body(&block)
    return unless @title || block_given?

    div(class: 'card-body') do
      if @title
        div(class: 'card-title') { @title }
      end

      div(class: "card-text", &block) if block_given?
    end
  end

  def footer(&block)
    return unless block_given?

    div(class: 'card-footer', &block)
  end
end
