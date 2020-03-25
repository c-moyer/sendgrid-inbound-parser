# Sendgrid Griddler Alternative

This class can be used to build emails from Sendgrid's inbound parse functionality. I built this as a light-weight alternative to [griddler](https://github.com/thoughtbot/griddler). Please note this class is meant to provide a starting point and hasn't been thoroughly tested. To use the class place it in your `app/lib` folder and call it in your controller action.

    def my_action
      email = Tmd::Email.new.parse(params)
    end  

If you're using a gem like Carrierwave for file uploads, you can reference `email.attachments` to upload attachments to external storage. Please note this code will not work if you select "raw formatting" in Sendgrid's admin console for your endpoint.
