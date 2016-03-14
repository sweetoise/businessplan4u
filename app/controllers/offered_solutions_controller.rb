class OfferedSolutionsController < ApplicationController
  layout 'site'
  def index
    @solutions = Solution.all
  end
end
