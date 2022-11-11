# frozen_string_literal: true

class MemberController < ApplicationController
  before_action :set_driver, only: %i[show edit update destroy]

  def index; end

  def rider_info
  end

  def all_statuses; end

  def overview
    @members = Member.where.not(member_id: current_member.member_id).order('last_name ASC')
    @yourself = Member.where(member_id: current_member.member_id)
  end 

  #from member overview page
   #POST /member/update
   def update_supervisor 
    @member = Member.find(params[:id])
    @member.update(is_supervisor: !@member.is_supervisor)
    redirect_to member_overview_path
   end

   def update_admin 
    @member = Member.find(params[:id])
    @member.update(is_admin: !@member.is_admin)
    redirect_to member_overview_path
   end
  
 
end
