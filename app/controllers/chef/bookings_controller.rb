class Chef::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:chef, Booking])
  end
end
