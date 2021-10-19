# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  before(:each) do
    assign(:products, [
             Product.create!(
               name: 'Name 1',
               code: 'Code1',
               price: '9.99'
             ),
             Product.create!(
               name: 'Name 2',
               code: 'Code2',
               price: '9.99'
             )
           ])

    assign(:current_basket, create(:basket))
  end

  it 'renders a list of products' do
    render
    assert_select 'tr>td', text: 'Name 1'.to_s, count: 1
    assert_select 'tr>td', text: 'Code2'.to_s, count: 1
    assert_select 'tr>td', text: '9.99'.to_s, count: 2
  end
end
