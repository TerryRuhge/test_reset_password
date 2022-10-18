# frozen_string_literal: true

json.array! @riders, partial: 'riders/rider', as: :rider
