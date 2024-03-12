# You've got Mail!
# Decipher and fix the error produced by the following code:

class Mail
  def to_s
    "#{self.class}"
  end
end

class Email < Mail
  attr_accessor :subject, :body

  def initialize(subject, body)
    @subject = subject
    @body = body
  end
end

class Postcard < Mail
  attr_reader :text

  def initialize(text)
    @text = text
  end
end

module Mailing
  def receive(mail, sender)
    mailbox << mail unless reject?(sender)
  end

  # Change if there are sources you want to block.
  def reject?(sender)
    false
  end

  def send_mail(destination, mail) # Change here
    "Sending #{mail} from #{name} to: #{destination}"
    # Omitting the actual sending.
  end
end

class CommunicationsProvider
  attr_reader :name, :account_number

  def initialize(name, account_number=nil)
    @name = name
    @account_number = account_number
  end
end

class EmailService < CommunicationsProvider
  include Mailing

  attr_accessor :email_address, :mailbox

  def initialize(name, account_number, email_address)
    super(name, account_number)
    @email_address = email_address
    @mailbox = []
  end

  def empty_inbox
    self.mailbox = []
  end
end

class TelephoneService < CommunicationsProvider
  def initialize(name, account_number, phone_number)
    super(name, account_number)
    @phone_number = phone_number
  end
end

class PostalService < CommunicationsProvider
  include Mailing # Change here
  
  attr_accessor :street_address, :mailbox

  def initialize(name, street_address)
    super(name)
    @street_address = street_address
    @mailbox = []
  end

  def change_address(new_address)
    self.street_address = new_address
  end
end

rafaels_email_account = EmailService.new('Rafael', 111, 'Rafael@example.com')
johns_phone_service   = TelephoneService.new('John', 122, '555-232-1121')
johns_postal_service  = PostalService.new('John', '47 Sunshine Ave.')
ellens_postal_service = PostalService.new('Ellen', '860 Blackbird Ln.')

puts johns_postal_service.send_mail(ellens_postal_service.street_address, Postcard.new('Greetings from Silicon Valley!'))
# => undefined method `860 Blackbird Ln.' for #<PostalService:0x00005571b4aaebe8> (NoMethodError)

# Source of Error:
# `PostalService` objects do not have access to the `#send` method defined in the
# `Mailing` module; as such, when `#send` is called on `johns_postal_service`, the
# `Object#send` method is invoked instead.
# `Object#send` allows you to 'send' a method call to an object, represented
#   by a string or symbol; in this case, the string referenced by `ellens_postal
#   _service.street address` ('860 Blackbird Ln.') is 'sent' to the 
#   `johns_postal_service` object, which then attempts to find a definition for a 
#   method named '860 Blackbird Ln.' - since there is no matching definition, a
#   NoMethodError is raised.

# How to Fix:
# We could include the Mailing module in the PostalService class, thus giving 
#   PostService objects access to Mailing#send.
# It's also good practice to prevent accidental overriding, by renaming #send
#   to something else (eg. #send_mail)