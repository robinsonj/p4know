require 'spec_helper'

describe 'HomeViews' do
  describe 'home/index.html.haml' do
    it 'renders home/index' do
      view.stub(:user_signed_in?).and_return(true)
      view.stub(:user_things).and_return([])
      view.stub(:results).and_return([])

      render template: 'home/index'
      expect(view).to render_template('home/index')
    end
  end
end
