class PageObject
  include AbstractController::Translation

  def initialize(page)
    @page = page
  end
end
