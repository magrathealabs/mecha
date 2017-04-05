module CapybaraExtras
  def wait_for_ajax(wait_time: Capybara.default_max_wait_time)
    Timeout.timeout(wait_time) do
      loop do
        active = page.evaluate_script('jQuery.active')
        break if active.zero?
      end
    end
  end
end
