# frozen_string_literal: true

class Whitelist < ApplicationRecord

    def validate(email)
        if !Whitelist.exists(:email => email)
            email.error << "This email is not on the whiteList"
        end
    end
end
