class RoomsController < ApplicationController
  # GET /rooms
  # GET /rooms.xml
  def index
    @rooms = Room.all
    @folk = Folk.find(params[:folk]) 
    @new_room = Room.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rooms }
    end
  end

  # GET /rooms/1
  # GET /rooms/1.xml
  def show
    @room = Room.find(params[:id])
    @folk = Folk.find(params[:folk])
    @message = Message.new(:room_id => @room.id, :folk_id => @folk.id)
    beat = HeartBeat.find_or_create_by_folk_id_and_room_id(params[:folk], params[:id])
    beat.touch
    session[:online] = @room.online_folks_ids

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @room }
    end
  end

  # POST /rooms
  # POST /rooms.xml
  def create
    @room = Room.new(params[:room])
    @folk = Folk.find params[:folk]

    respond_to do |format|
      if @room.save
        format.html #{ render :nothing => true }
        format.xml  { render :xml => @room, :status => :created, :location => @room }
      else
        format.xml  { render :xml => @room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.xml
  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { render :nothing => true }
      format.xml  { head :ok }
    end
  end
end
