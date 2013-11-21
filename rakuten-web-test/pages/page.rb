class Page

  def open(url)
    @@browser.get url
  end

  def close
    @@browser.quit
  end

  def title
    @@browser.title
  end

  def page
    Capybara.current_session
  end

end