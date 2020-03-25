class Tmd::Email

  attr_reader :attachments_count
  attr_reader :attachments
  attr_reader :to
  attr_reader :from
  attr_reader :headers
  attr_reader :subject
  attr_reader :body

  def initialize()
    @attachments = []
    @headers = {}
  end


  def parse(params)
    @attachments_count = params[:attachments]
    @to = extract_email(params[:to])
    @from = extract_email(params[:from])
    @subject = params[:subject]
    @body = params[:text]

    params[:headers].split("\n").each do |i|
      a = i.split(": ", 2) #2 specifies the maximun number of fields to be returned in the array forcing the first occurrence of ": " to be split only.
      @headers[a.first] = a.last
    end

    if params["attachment-info"].present?
      attachment_info = JSON.parse(params["attachment-info"])

      index = 1
      params[:attachments].to_i.times do
        puts params["attachment#{index}"].class
        @attachments << params["attachment#{index}"]
        index += 1
      end
    end
  end

  private
  def extract_email(string)
    match_data = string.match(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i)

    if match_data
      email = match_data[0]
    else
      email = string
    end
    return email
  end

end
