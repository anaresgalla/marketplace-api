# frozen_string_literal: true

user = FactoryBot.create(:user)
products = FactoryBot.create_list(:product, 10, user: user)
