require "playwright"

module X
  URL = "https://x.com/riristage_PR"

  def self.fetch_code
    Playwright.create(playwright_cli_executable_path: "npx playwright") do |pw|
      browser = pw.chromium.launch(
        headless: true
      )

      begin
        page = browser.new_page

        page.goto(URL)

        # 読み込み待ち
        page.wait_for_timeout(8000)

        text = page.text_content("body")

        puts text[0,1000]

        code = text[/【([A-Z0-9]{16})】/, 1]

        raise "コードなし" unless code

        code

      ensure
        browser.close
      end
    end
  end
end
