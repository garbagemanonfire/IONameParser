class Parse
    def self.parse_names(prefixes, suffixes, name_string)

        parsed_name = {pre:"", first:"", middle:"", last:"", suffix:""}

        word = name_string.split
        parsed_name[:suffix] = word.pop if suffixes.include? word.last
        parsed_name[:last] = word.pop
        parsed_name[:pre] = word.shift if prefixes.include? word.first
        parsed_name[:first] = word.shift if word[0] != nil
        parsed_name[:middle] = word.shift if word[0] != nil
        parsed_name.values
    end

    def self.parse_phone(phone_string)

        parsed_phone = {country:"", area:"", local:"", line:"", extension:""}

        phone = phone_string.scan(/\d+/)

        (phone[0].length < 2)? parsed_phone[:country] = phone.shift : ""
        parsed_phone[:area] = phone.shift
        parsed_phone[:local] = phone.shift
        parsed_phone[:line] = phone.shift
        (phone.first)? parsed_phone[:extension] = phone.shift : ""

        parsed_phone.values
    end

    def self.parse_twitter(twitter_string)
        parsed_tweet = {tweet:"Not Found"}
        parsed_tweet[:tweet] = twitter_string.scan(/[^@]/).join if !twitter_string.empty?
        parsed_tweet.values
    end

    def self.parse_email (email_string)
        parsed_email = {email:"Not Found"}
        parsed_email[:email] = email_string if email_string =~ /(^[^@]+[@].+[.].{3})/
        parsed_email.values
    end
end
