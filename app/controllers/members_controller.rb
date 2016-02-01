class MembersController < ApplicationController

  def index
    @members = Member.where(latest_semester: 'Fall 2015').sort_by{|x| x.committee}
  end

  def update
    render json: params
  end

  def update_commitments
    if current_member
      default = Member.default_commitments
      if params[:hours]
        params[:hours].each do |hour|
          default[hour.to_i] = 1
        end
      end
      #TODO: current_member is cached?
      mem = Member.find(current_member.id)
      mem.commitments = default
      mem.save!
      render json: default
    else
      redirect_to '/auth/google_oauth2'
    end
  end

  def me
    if current_member
      @me = current_member
    end
  end


end
