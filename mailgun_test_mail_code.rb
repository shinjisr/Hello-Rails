def send_simple_message
    RestClient.post "https://api:key-147917d10c8520f0bc07c3237c950cc6"
        "@api.mailgun.net/v3/sandboxabff5208e4894675abf0998cc77f3f0b.mailgun.org/messages",
        :from => "Mailgun Sandbox <postmaster@sandboxabff5208e4894675abf0998cc77f3f0b.mailgun.org>",
        :to => "StevenCCH <stevencch99@gmail.com>",
        :subject => "Hello StevenCCH",
        :text => "Congratulations StevenCCH, you just sent an email with Mailgun!  You are truly awesome!"
end

# You can see a record of this email in your logs: https://mailgun.com/app/logs .

# You can send up to 300 emails/day from this sandbox server.
# Next, you should add your own domain so you can send 10,000 emails/month for free.