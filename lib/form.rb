require "playwright"

module Form
  URL = "https://www.ririsa-riristage.com/special/present-form/"

  def self.submit(user_id:, code:)
    Playwright.create(playwright_cli_executable_path: "npx playwright") do |playwright|
      browser = playwright.chromium.launch(
        headless: true
      )

      page = browser.new_page

      page.goto(URL)

      page.wait_for_load_state

      page.fill('input[name="user_id"]', user_id)
      page.fill('input[name="serial_code"]', code)

      page.locator("a#submit").click
      
      page.wait_for_timeout(3000)
      
      body = page.text_content("body")
      puts body

      browser.close
    end
  end
end
