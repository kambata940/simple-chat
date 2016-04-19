# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
module ApplicationCable
  # When a client connects to our Action Cable server,
  # a connection object will be instantiated.
  class Connection < ActionCable::Connection::Base
    identified_by :username

    def connect
      Rails.logger.info("#{cookies.signed[:username]}Connection!!!!!!\n!!!!!!!!!!!!!!!!\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
      self.username = cookies.signed[:username]
    end
  end
end
