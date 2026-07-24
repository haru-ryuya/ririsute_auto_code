require_relative "lib/x"
require_relative "lib/form"

begin
  code = X.fetch_code

  puts "取得: #{code}"

  Form.submit(
    user_id: ENV["USER_ID"],
    code: code
  )

  puts "完了"

rescue => e
  raise "エラーしました: #{e.message}" 
end
